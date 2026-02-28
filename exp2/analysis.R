library(tidyverse)
library(lme4)
library(lmerTest)
library(emmeans)
library(patchwork)

df <- read_csv("falben_exp2_simulated_f.csv") %>%
  mutate(
    expectancy = factor(expectancy, levels = c("self", "friend", "equal"), labels = c("Self", "Friend", "Equal")),
    owner = factor(owner, levels = c("self", "friend"), labels = c("Self-Owned", "Friend-Owned"))
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
  summarise(value = mean(rt), se = sd(rt) / sqrt(n()), .groups = "drop")

acc_summary <- df %>%
  group_by(expectancy, owner) %>%
  summarise(value = mean(accuracy) * 100, se = (sd(accuracy) / sqrt(n())) * 100, .groups = "drop")

p1 <- ggplot(rt_summary, aes(x = expectancy, y = value, fill = owner)) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.8), color = "black", width = 0.7) +
  geom_errorbar(aes(ymin = value - se, ymax = value + se), position = position_dodge(width = 0.8), width = 0.15) +
  scale_fill_manual(values = c("Self-Owned" = "grey40", "Friend-Owned" = "grey90")) +
  coord_cartesian(ylim = c(380, 540)) +
  scale_y_continuous(breaks = seq(380, 540, by = 40)) +
  theme_classic() +
  labs(x = "Expectancy", y = "Response Time (ms)") +
  theme(
    legend.position = c(0.85, 0.85),
    legend.title = element_blank(),
    legend.background = element_blank(),
    axis.text = element_text(color = "black")
  )

p2 <- ggplot(acc_summary, aes(x = expectancy, y = value, fill = owner)) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.8), color = "black", width = 0.7) +
  geom_errorbar(aes(ymin = value - se, ymax = value + se), position = position_dodge(width = 0.8), width = 0.15) +
  scale_fill_manual(values = c("Self-Owned" = "grey40", "Friend-Owned" = "grey90")) +
  coord_cartesian(ylim = c(70, 100)) +
  scale_y_continuous(breaks = seq(70, 100, by = 5)) +
  theme_classic() +
  labs(x = "Expectancy", y = "Accuracy (%)") +
  theme(
    legend.position = c(0.85, 0.85),
    legend.title = element_blank(),
    legend.background = element_blank(),
    axis.text = element_text(color = "black")
  )

combined_plot <- p1 / p2
print(combined_plot)