# Experiment 3: five basic base-R visualizations
output <- file.path(getwd(), "outputs")
dir.create(output, showWarnings = FALSE, recursive = TRUE)

pdf(file.path(output, "basic_visualizations.pdf"), width = 7, height = 5)
x <- c(1, 2, 3, 4, 5)
y <- c(10, 15, 12, 18, 20)
plot(x, y, type = "o", main = "Line Graph", xlab = "X Values", ylab = "Y Values")

subjects <- c("Python", "Java", "R", "Tableau", "SQL")
marks <- c(85, 78, 82, 90, 88)
barplot(marks, names.arg = subjects, main = "Marks by Subject", xlab = "Subject", ylab = "Marks")

values <- c(35, 25, 20, 20)
pie(values, labels = c("Python", "Java", "R", "Tableau"), main = "Technology Usage")

hours <- c(1, 2, 3, 4, 5, 6)
study_marks <- c(45, 50, 58, 65, 72, 80)
plot(hours, study_marks, pch = 19, main = "Study Hours vs Marks", xlab = "Study Hours", ylab = "Marks")

all_marks <- c(45, 50, 52, 55, 58, 60, 62, 65, 68, 70, 72, 75, 78, 80, 82, 85, 88, 90)
hist(all_marks, breaks = 5, main = "Distribution of Marks", xlab = "Marks", ylab = "Frequency")
dev.off()
cat("Saved outputs/basic_visualizations.pdf\n")