library(tidyverse)
library(lme4)
library(lmerTest)
library(emmeans)

df <- read_csv("falben_exp2_simulated.csv") %>%
  mutate(
    expectancy = factor(expectancy, levels = c("self", "equal", "friend")),
    owner = factor(owner, levels = c("self", "friend"))
  )

rt_data <- df %>% filter(accuracy == 1)

rt_model <- lmer(rt ~ expectancy * owner + (1 | participant), data = rt_data)
print(summary(rt_model))

rt_simple_effects <- emmeans(rt_model, pairwise ~ owner | expectancy)
print(rt_simple_effects)

acc_model <- glmer(accuracy ~ expectancy * owner + (1 | participant), data = df, family = binomial)
print(summary(acc_model))

acc_simple_effects <- emmeans(acc_model, pairwise ~ owner | expectancy)
print(acc_simple_effects)

rt_summary <- rt_data %>%
  group_by(expectancy, owner) %>%
  summarise(value = mean(rt), se = sd(rt) / sqrt(n()), .groups = "drop") %>%
  mutate(metric = "Reaction Time (ms)")

acc_summary <- df %>%
  group_by(expectancy, owner) %>%
  summarise(value = mean(accuracy), se = sd(accuracy) / sqrt(n()), .groups = "drop") %>%
  mutate(metric = "Accuracy (Proportion)")

plot_data <- bind_rows(rt_summary, acc_summary)

ggplot(plot_data, aes(x = expectancy, y = value, group = owner, linetype = owner, shape = owner)) +
  geom_line(linewidth = 1) +
  geom_point(size = 3) +
  geom_errorbar(aes(ymin = value - se, ymax = value + se), width = 0.1) +
  facet_wrap(~ metric, scales = "free_y") +
  theme_classic() +
  labs(
    x = "Expectancy Condition",
    y = "Measure",
    linetype = "Stimulus Owner",
    shape = "Stimulus Owner"
  ) +
  theme(
    strip.background = element_blank(),
    strip.text = element_text(size = 12),
    legend.position = "bottom"
  )