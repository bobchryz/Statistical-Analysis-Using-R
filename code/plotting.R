library(gapminder)
library(ggplot2)
library(gganimate)
?gapminder
library(gifski)

p <- ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, colour = country)) +
  geom_point(alpha = 0.7) +
  scale_colour_manual(values = country_colors) +
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  facet_wrap(~continent) +
  theme(legend.position = 'none') +
  labs(title = 'Year: {frame_time}', x = 'GDP per capita', y = 'life expectancy') +
  transition_time(year) +
  ease_aes('linear')

p
animate(p, 100, 10)

?theme 
library(ggplot2)

ggplot(iris, aes(Petal.Length, Petal.Width, col = Species)) + geom_point() + geom_line() + xlab("Length") + ylab("Width") 

?ggplot
df <- data.frame(
  gp = factor(rep(letters[1:3], each = 10)),
  y = rnorm(30)
)
ds <- do.call(rbind, lapply(split(df, df$gp), function(d) {
  data.frame(mean = mean(d$y), sd = sd(d$y), gp = d$gp)
}))

# The summary data frame ds is used to plot larger red points on top
# of the raw data. Note that we don't need to supply `data` or `mapping`
# in each layer because the defaults from ggplot() are used.
ggplot(df, aes(gp, y)) +
  geom_point() +
  geom_point(data = ds, aes(y = mean), colour = 'red', size = 3)

# Same plot as above, declaring only the data frame in ggplot().
# Note how the x and y aesthetics must now be declared in
# each geom_point() layer.
ggplot(df) +
  geom_point(aes(gp, y)) +
  geom_point(data = ds, aes(gp, mean), colour = 'red', size = 3)

# Alternatively we can fully specify the plot in each layer. This
# is not useful here, but can be more clear when working with complex
# mult-dataset graphics
ggplot() +
  geom_point(data = df, aes(gp, y)) +
  geom_point(data = ds, aes(gp, mean), colour = 'red', size = 3) +
  geom_errorbar(
    data = ds,
    aes(gp, mean, ymin = mean - sd, ymax = mean + sd),
    colour = 'red',
    width = 0.4
  )

ggplot(iris)+ geom_bar(aes(Sepal.Length, fill = Species))

stat <- ggplot(gapminder) + geom_bar(aes(lifeExp)) + 
transition_time(year)


#get packages
library(tidyverse);
library(gganimate)

#load data
grand_slams <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-04-09/grand_slams.csv")
grand_slams_clean <- grand_slams %>% 
  mutate(tournament_order = case_when(grand_slam=='australian_open' ~ 1,
                                      grand_slam=='french_open' ~ 2,
                                      grand_slam=='wimbledon' ~ 3,
                                      grand_slam=='us_open' ~ 4)) %>%
  arrange(tournament_date)

#get data from 1968-1975, helps avoid ties or incomplete bar chart at beginning
init_df <- grand_slams_clean %>%
  filter(year <= 1975) %>%
  group_by(name) %>%
  filter(rolling_win_count==max(rolling_win_count)) %>%
  ungroup() %>%
  top_n(10, wt=rolling_win_count) %>%
  arrange(desc(rolling_win_count)) %>%
  select(name,gender, rolling_win_count) %>%
  mutate(curr_year = 1975,
         ordering = as.double(rev(seq(10:1))) * 1.0)

#outer loop gets year
for (i in 1976:2019) {
  #inner loop gets tournament
  for (j in 1:4) {
    tmp_df <- grand_slams_clean %>%
      #filter data up to correct point in time
      filter(year < i | (year==i & tournament_order <= j)) %>%
      #get each players max win count
      group_by(name) %>% 
      filter(rolling_win_count==max(rolling_win_count)) %>% 
      ungroup() %>% 
      top_n(10, wt=rolling_win_count) %>%
      select(name, gender, rolling_win_count) %>%
      arrange(desc(rolling_win_count)) %>%
      slice(1:10) %>%
      #add var for curr_year, ordering for easy bar chart (reverse it cuz we're make a horizontal chart)
      mutate(curr_year = i,
             tournament_num = j,
             ordering = as.double(rev(seq(10:1))) * 1.0) 
    init_df <- init_df %>%
      bind_rows(tmp_df)
  }
}

final_df <- init_df %>% 
  group_by(curr_year, tournament_num) %>% 
  mutate(frame_id = group_indices()) %>% 
  ungroup()

final_df <- final_df %>% mutate(name = ifelse(name == 'Evonne Goolagong Cawley', 'Evonne Goolagong', name))

my_font <- 'Quicksand Light'
my_background <- 'antiquewhite'
my_pal <- c('#F8AFA8','#74A089') #colors for bars (from wesanderson)
my_theme <- my_theme <- theme(text = element_text(family = my_font),
                              rect = element_rect(fill = my_background),
                              plot.background = element_rect(fill = my_background, color = NA),
                              panel.background = element_rect(fill = my_background, color = NA),
                              panel.border = element_blank(),
                              plot.title = element_text(face = 'bold', size = 20),
                              plot.subtitle = element_text(size = 14),
                              panel.grid.major.y = element_blank(),
                              panel.grid.minor.y = element_blank(),
                              panel.grid.major.x = element_line(color = 'grey75'),
                              panel.grid.minor.x = element_line(color = 'grey75'),
                              legend.position = 'none',
                              plot.caption = element_text(size = 8),
                              axis.ticks = element_blank(),
                              axis.text.y =  element_blank())

theme_set(theme_light() + my_theme)
?theme_set

final_plot <- ggplot(aes(ordering, group = name), data = final_df) +
  geom_tile(aes(y = rolling_win_count / 2, 
                height = rolling_win_count,
                width = 0.9, fill=gender), alpha = 0.9) +
  scale_fill_manual(values = my_pal) +
  geom_text(aes(y = rolling_win_count, label = name), family=my_font, nudge_y = -2, size = 3) +
  #convert to character to get rid of blurry trailing decimals
  geom_text(aes(y = rolling_win_count, label = as.character(rolling_win_count)), family=my_font, nudge_y = 0.5) +
  geom_text(aes(x=1,y=18.75, label=paste0(curr_year)), family=my_font, size=8, color = 'gray45') +
  coord_cartesian(clip = "off", expand = FALSE) +
  coord_flip() +
  labs(title = 'Most Grand Slam Singles Championships',
       subtitle = 'Open Era Only',
       caption = 'data source: Wikipedia | plot by @emilykuehler',
       x = '',
       y = '') +
  transition_states(frame_id, 
                    transition_length = 4, state_length = 3) +
  ease_aes('cubic-in-out')