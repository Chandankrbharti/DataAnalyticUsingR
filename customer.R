Data_url="C:/Users/Administrator/Documents/Wholesale customers data.csv"
Customer_data<-read.csv(Data_url)
View(Customer_data)
colSums(is.na(Customer_data))
str(Customer_data)
head(Customer_data)
summary(Customer_data)

customer_data_clean<-Customer_data[,c(-1,-2)]
View(customer_data_clean)
customer_data_num_sacl<-as.data.frame(scale(customer_data_clean))
View(customer_data_num_sacl)

mean(customer_data_clean$Fresh)
sd(customer_data_clean$Fresh)
(12669-mean(customer_data_clean$Fresh))/sd(customer_data_clean$Fresh)

set.seed(2)
sample(1:100,4)

cluster_customer<-kmeans(customer_data_num_sacl,8)
cluster_customer
cluster_customer$cluster
cluster_customer$size
class(cluster_customer)
str(cluster_customer)

cluster_customer_data<-kmeans(Customer_data,8)
cluster_customer_data
cluster_customer_data$cluster
cluster_customer_data$size
class(cluster_customer_data)
str(cluster_customer_data)

l

