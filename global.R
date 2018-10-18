library(shiny)
library(stringr)
library(tm)
library(tidyverse)

bigram <- readRDS("bigram.RData")
trigram <- readRDS("trigram.RData")
quadgram <- readRDS("quadgram.RData")

bigram <- bigram %>% mutate(text = paste(word1, sep=' '))
trigram <- trigram %>% mutate(text = paste(word1, word2, sep=' '))
quadgram <- quadgram %>% mutate(text = paste(word1, word2, word3, sep=' '))

df_sample <- bind_rows(sample_n(bigram %>% select(text) %>% mutate(type = 'bigram'), 5),
                       sample_n(trigram %>% select(text) %>% mutate(type = 'trigram'), 5),
                       sample_n(quadgram %>% select(text) %>% mutate(type = 'quadgram'), 5))

predictWord <- function(the_word) {
  word_add <- stripWhitespace(removeNumbers(removePunctuation(tolower(the_word),preserve_intra_word_dashes = TRUE)))
  word <- strsplit(word_add, " ") %>% unlist
  n <- length(word)
  
  if(n == 1){
    pred <- (bigram %>% filter(text == word_add))$word2[1] %>% as.character
  }
  else if(n == 2){
    pred <- (trigram %>% filter(text == word_add))$word3[1] %>% as.character
  }
  else if(n == 3){
    pred <- (quadgram %>% filter(text == word_add))$word4[1] %>% as.character
  }
  else{
    pred <- 'Try with a custom sentence in the examples. We didn\'t found a prediction :('
  }
  return(pred)
}
