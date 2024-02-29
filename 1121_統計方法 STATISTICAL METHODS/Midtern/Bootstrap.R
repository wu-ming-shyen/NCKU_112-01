lifetime <- read.csv("Q4.csv")
library(boot)

# 定義統計量
boot_stat <- function(data, indices) {
  d.boot <- data[indices]
  return(c(mean(d.boot), quantile(d.boot, c(0.025, 0.975))))
}

# 執行 Bootstrap
boot_results <- boot(data = lifetime$lifetime, statistic = boot_stat, R = 1000)

# 查看 Bootstrap 信賴區間
print(boot_results, index = 2:3, conf = 0.95)


# 查看Bootstrsp信賴區間
print(quantile(boot_cis[,2:3], c(0.025, 0.975)))