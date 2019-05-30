#install.packages("KoNLP")

library(KoNLP)

useNIADic()



tt=read.csv("D:/title&text.csv",header = T)

cmt=read.csv("D:/comment.csv",header = T)

title=as.character(tt$title)

text=as.character(tt$txt)

np=as.vector(tt$np)



#install.packages('tidygraph')

#install.packages('ggraph')

#install.packages("dplyr")

#install.packages("tidyverse")

library(tidyverse)

library(reshape2)

library(ggraph)

library(tidygraph)

library(dplyr)



title1=title[-grep("È¸¿ø¿¡ ÀÇÇØ »èÁ¦µÈ ±ÛÀÔ´Ï´Ù.",title)]

title0=title1[-grep("title",title1)]



text1=text[-grep("È¸¿ø¿¡ ÀÇÇØ »èÁ¦µÈ ±ÛÀÔ´Ï´Ù.",title)]

text0=text1[-grep("title",title)]



tit=SimplePos09(title0) %>% melt %>% as_tibble %>% select(3,1)



title_nouns=tit %>% mutate(nouns=str_match(value,'([°¡-ÆR]+)/N')[,2]) %>% na.omit %>% filter(str_length(nouns)>=2) %>% count(nouns,sort=TRUE)

title_nouns



#install.packages("wordcloud2")

library(wordcloud2)



title_nouns %>% filter(n>=2) %>% wordcloud2() #¿öµå Å¬¶ó¿ìµå











tn_count=title_nouns %>% head(15)

tn2=tit %>% mutate(nouns=str_match(value,'([°¡-ÆR]+)/N')[,2]) %>% na.omit %>% filter(str_length(nouns)>=2) %>% select(3,1)



tn3= tn2 %>% filter(nouns %in% tn_count$nouns)

tn3





#install.packages("igraph")

library(igraph)



mg= graph_from_data_frame(tn3)

mg

#¹ÙÀÌ±×·¥ 

bigram_tn2=tn2 %>% na.omit() %>% select(nouns) %>% mutate(lead=lead(nouns)) %>% unite(bigram,c(nouns,lead),sep=' ') %>% count(bigram,sort=T) %>% head(20) %>% separate(bigram,c('word1','word2'))

bigram_tn2



bigram_tn2 %>% as_tbl_graph %>% ggraph() + geom_edge_link(aes(start_cap = label_rect(node1.name), end_cap = label_rect(node2.name))) + geom_node_text(aes(label=name))




