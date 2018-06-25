

# save credentials
### https://apps.twitter.com/
library(httr)
#library(devtools)
library(twitteR)
library(ROAuth)
#install.packages('base64enc')
#library(base64enc)
library(plyr)
library(stringr)
library(ggplot2)
library(httpuv)
library(RCurl)
# Set SSL certs globally


# Access level
# Read and write (modify app permissions) 
# 
# Consumer Key (API Key)
# PgrymDTeF5wQpEK7HXNcwJKXK (manage keys and access tokens) 
# 
# Callback URL
# https://apps.twitter.com/app/new 
# 
# Callback URL Locked
# Yes
# 
# Sign in with Twitter
# Yes
# 
# App-only authentication
# https://api.twitter.com/oauth2/token
# 
# Request token URL
# https://api.twitter.com/oauth/request_token
# 
# Authorize URL
# https://api.twitter.com/oauth/authorize
# 
# Access token URL
# https://api.twitter.com/oauth/access_token


options(RCurlOptions = list(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl")))

requestURL = "https://api.twitter.com/oauth/request_token"
accessURL = "https://api.twitter.com/oauth/access_token"
authURL = "https://api.twitter.com/oauth/authorize"
consumerKey = "H6Ch42bRYZdQpWmzMNpRKutfC"
consumerSecret = "S5SQTjdaJyXxs6dQpkybXdvYRspSs2QcgRM5oh0f1vR8FVxeU0"

accessToken = "786394311021637632-CeGGxaMWgDS5IBERW0P90FSj0oqPbed"
accessSecret = "2Mv0GIJXbqC8gE9SraKdqy8mHmpwsgu6HepVxZwbAaYod"
options(httr_oauth_cache=T)

setup_twitter_oauth(consumerKey,
                    consumerSecret,
                    accessToken,
                    accessSecret)
  
  r_stats <- searchTwitter("", n=100)
  r_stats
  class(r_stats)
  r_stats.df = twListToDF(r_stats) 
  View(r_stats.df)


# Sentiment Analysis or social media analytics 
library(plyr)
library(stringr)
library(ggplot2)

DatasetKKRiders <- read.csv("C:\\Users\\Administrator\\Desktop\\New folder\\KKRidersTweets.csv")
#DatasetKKRiders$text<-as.factor(DatasetKKRiders$text)

Datasetlionsdenkxip <- read.csv("C:\\Users\\Administrator\\Desktop\\New folder\\lionsdenKXIPTweets.csv")
#Datasetlionsdenkxip$text<-as.factor(Datasetlionsdenkxip$text)

###############################
#Sentiment Function     
###############################

library (plyr)
library (stringr)

score.sentiment = function(sentences, pos.words, neg.words, .progress='none')  
{  
  require(plyr)  
  require(stringr)       
  
  # we got a vector of sentences. plyr will handle a list  
  # or a vector as an "l" for us  
  # we want a simple array ("a") of scores back, so we use   
  # "l" + "a" + "ply" = "laply":  
  
  scores = laply(sentences, function(sentence, pos.words, neg.words) {  
    
    # clean up sentences with R's regex-driven global substitute, gsub():  
    
    sentence = gsub('[[:punct:]]', '', sentence)  
    
    sentence = gsub('[[:cntrl:]]', '', sentence)  
    
    sentence = gsub('\\d+', '', sentence)  
    
    # and convert to lower case:  
    
    sentence = tolower(sentence)  
    
    # split into words. str_split is in the stringr package  
    
    word.list = str_split(sentence, '\\s+')  
    
    # sometimes a list() is one level of hierarchy too much  
    
    words = unlist(word.list)  
    
    # compare our words to the dictionaries of positive & negative terms  
    
    pos.matches = match(words, pos.words)  
    neg.matches = match(words, neg.words)  
    
    # match() returns the position of the matched term or NA  
    # we just want a TRUE/FALSE:  
    
    pos.matches = !is.na(pos.matches)  
    
    neg.matches = !is.na(neg.matches)  
    
    # and conveniently enough, TRUE/FALSE will be treated as 1/0 by sum():  
    
    score = sum(pos.matches) - sum(neg.matches)  
    
    return(score)  
    
  }, pos.words, neg.words, .progress=.progress )  
  scores.df = data.frame(score=scores, text=sentences)  
  return(scores.df)  
} 


############################################
#Scoring Tweets & Adding a column      
############################################

## List of positive and negative words can be downloaded from below link
## http://www.cs.uic.edu/~liub/FBS/sentiment-analysis.html#lexicon

#Load sentiment word lists
hu.liu.pos = scan('F:/New folder/R Videos/positive-words.txt', what='character', comment.char=';')
hu.liu.neg = scan('F:/New folder/R Videos/negative-words.txt', what='character', comment.char=';')

#Add words to list # Optional 
pos.words = c(hu.liu.pos, 'upgrade')
neg.words = c(hu.liu.neg, 'wtf', 'wait','waiting', 'epicfail', 'mechanical')

#Score all tweets 
KKRiders.scores = score.sentiment(DatasetKKRiders$text, pos.words,neg.words, .progress='text')
lionsdenkxip.scores = score.sentiment(Datasetlionsdenkxip$text, pos.words,neg.words, .progress='text')
View(KKRiders.scores)

#path<-""
#write.csv(KKRiders.scores,file=paste(path,"KKRidersScores.csv",sep=""),row.names=TRUE)
#write.csv(lionsdenkxip.scores,file=paste(path," lionsdenkxipScores.csv",sep=""),row.names=TRUE)

KKRiders.scores$Team = 'KKRiders'
View(KKRiders.scores)
lionsdenkxip.scores$Team = 'lionsdenkxip'

############################# 
# Visualizing         
#############################

hist(KKRiders.scores$score)
qplot(KKRiders.scores$score)

hist(lionsdenkxip.scores$score)
qplot(lionsdenkxip.scores$score)

#################################
#Comparing 2 data sets                
#################################

# all.scores = rbind(KKRiders.scores, lionsdenkxip.scores, MLB.scores)
all.scores = rbind(KKRiders.scores, lionsdenkxip.scores)
ggplot(data=all.scores) + # ggplot works on data.frames, always
  geom_bar(mapping=aes(x=score, fill=Team), binwidth=1) +
  facet_grid(Team~.) + # make a separate plot for each hashtag
  theme_bw() + scale_fill_brewer() # plain display, nicer colors
