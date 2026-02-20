library(tidyverse)
library(lme4)
library(lmerTest)
library(patchwork)

data <- read_csv("falben_exp1_simulated.csv") %>%
  mutate(
    rt_sec = rt / 1000, 
    expectancy = factor(expectancy, levels = c("none", "equal"), labels = c("None", "Equal")),
    # Factor levels corrected to strictly map Self-Owned to the left plotting position
    owner = factor(owner, levels = c("self", "friend"), labels = c("Self-Owned", "Friend-Owned")),
    participant = as.factor(participant)
  )

contrasts(data$expectancy) <- contr.sum(2)
contrasts(data$owner) <- contr.sum(2)

clean_data <- data %>% filter(rt >= 200)
rt_data <- clean_data %>% filter(accuracy == 1)

rt_model <- lmer(rt_sec ~ expectancy * owner + (1 | participant), data = rt_data)
summary(rt_model)

acc_model <- glmer(accuracy ~ expectancy * owner + (1 | participant), 
                   data = clean_data, family = binomial)
summary(acc_model)

rt_subj <- rt_data %>%
  group_by(participant, expectancy, owner) %>%
  summarise(subj_mean_rt = mean(rt), .groups = "drop")

rt_summary <- rt_subj %>%
  group_by(expectancy, owner) %>%
  summarise(
    mean_rt = mean(subj_mean_rt),
    se_rt = sd(subj_mean_rt) / sqrt(n()),
    .groups = "drop"
  )

acc_subj <- clean_data %>%
  group_by(participant, expectancy, owner) %>%
  summarise(subj_mean_acc = mean(accuracy) * 100, .groups = "drop")

acc_summary <- acc_subj %>%
  group_by(expectancy, owner) %>%
  summarise(
    mean_acc = mean(subj_mean_acc),
    se_acc = sd(subj_mean_acc) / sqrt(n()),
    .groups = "drop"
  )

plot_rt <- ggplot(rt_summary, aes(x = expectancy, y = mean_rt, fill = owner)) +
  geom_bar(stat = "identity", position = position_dodge(0.9), color = "black", width = 0.6) +
  geom_errorbar(aes(ymin = mean_rt, ymax = mean_rt + se_rt), 
                width = 0.15, position = position_dodge(0.9)) +
  scale_fill_manual(values = c("Self-Owned" = "grey45", "Friend-Owned" = "grey85")) +
  scale_y_continuous(breaks = seq(460, 580, by = 20)) +
  coord_cartesian(ylim = c(460, 580)) +
  labs(y = "Response Time (ms)", x = "Expectancy", fill = NULL) +
  theme_classic() +
  theme(legend.position = "top", axis.text = element_text(color = "black"))

plot_acc <- ggplot(acc_summary, aes(x = expectancy, y = mean_acc, fill = owner)) +
  geom_bar(stat = "identity", position = position_dodge(0.9), color = "black", width = 0.6) +
  geom_errorbar(aes(ymin = mean_acc, ymax = mean_acc + se_acc), 
                width = 0.15, position = position_dodge(0.9)) +
  scale_fill_manual(values = c("Self-Owned" = "grey45", "Friend-Owned" = "grey85")) +
  scale_y_continuous(breaks = seq(70, 100, by = 5)) +
  coord_cartesian(ylim = c(70, 100)) +
  labs(y = "Accuracy (%)", x = "Expectancy", fill = NULL) +
  theme_classic() +
  theme(legend.position = "none", axis.text = element_text(color = "black"))

plot_rt / plot_acc