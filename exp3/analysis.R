library(readr)
library(dplyr)
library(lme4)
library(lmerTest)
library(ggplot2)
library(patchwork)

df <- read_csv("falben_exp3_simulated.csv")
df <- df %>% filter(rt >= 200)

df$expectancy <- factor(df$expectancy, levels = c("self", "friend"))
df$owner <- factor(df$owner, levels = c("self", "friend"))

df_correct <- df %>% filter(accuracy == 1)
df_correct$expectancy <- factor(df_correct$expectancy, levels = c("self", "friend"))
df_correct$owner <- factor(df_correct$owner, levels = c("self", "friend"))

rt_model <- lmer(rt ~ expectancy * owner + (1 | participant), data = df_correct)
print(summary(rt_model))

acc_model <- glmer(accuracy ~ expectancy * owner + (1 | participant), data = df, family = binomial)
print(summary(acc_model))

rt_summary <- df_correct %>%
  group_by(expectancy, owner) %>%
  summarise(mean_rt = mean(rt), se_rt = sd(rt)/sqrt(n()), .groups = "drop")

p1 <- ggplot(rt_summary, aes(x = expectancy, y = mean_rt, fill = owner)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  geom_errorbar(aes(ymin = mean_rt - se_rt, ymax = mean_rt + se_rt), position = position_dodge(0.9), width = 0.2) +
  theme_minimal() +
  labs(y = "Reaction Time (ms)", x = "Expectancy", fill = "Owner", title = "Reaction Time Interaction")

acc_summary <- df %>%
  group_by(expectancy, owner) %>%
  summarise(mean_acc = mean(accuracy), se_acc = sd(accuracy)/sqrt(n()), .groups = "drop")

p2 <- ggplot(acc_summary, aes(x = expectancy, y = mean_acc, fill = owner)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  geom_errorbar(aes(ymin = mean_acc - se_acc, ymax = mean_acc + se_acc), position = position_dodge(0.9), width = 0.2) +
  theme_minimal() +
  labs(y = "Proportion Correct", x = "Expectancy", fill = "Owner", title = "Accuracy Interaction")

p1 + p2 + plot_layout(guides = "collect")