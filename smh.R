#install.packages("RSelenium")
library(RSelenium) 



pjs <- wdman::phantomjs()

remDr <- remoteDriver(browserName = "phantomjs", port = 4567L)



remDr$open() 

remDr$navigate("https://nid.naver.com/nidlogin.login")



id = remDr$findElement(using="id", value="id")

id$setElementAttribute("value", "cjsrnr35126")

Sys.sleep(3)



pw = remDr$findElement(using="id", value="pw")

pw$setElementAttribute("value", "4esdfc123!")

Sys.sleep(3)



loginBtn = remDr$findElement(using="css", value=".btn_global")

loginBtn$clickElement()


for(k in 1:10){
pageurl="https://cafe.naver.com/suhui?iframe_url=/ArticleList.nhn%3Fsearch.clubid=10197921%26search.menuid=3786%26search.boardtype=L%26search.questionTab=A%26search.totalCount=151%26search.page=1"
#paste0(pageurl,1,sep="")


remDr$navigate(paste0(pageurl,k,sep=""))

Sys.sleep(sample(3:6, 1))

remDr$switchToFrame("cafe_main")





articlelist=remDr$findElements(using = "css",value ="#main-area  > div:nth-child(5) > table > tbody > tr")





list.f=function(i,v){
  
  borad=articlelist[[i]]$findChildElement(using="css", value=v)
  
  return(as.character(borad$getElementText()))
  
}

sid.n.loc="td.td_article div.inner_number"

tit.loc="td.td_article div.inner_list > a"

nic.loc="td.td_name a"



out=cbind(list.f(1,sid.n.loc),list.f(1,tit.loc),list.f(1,nic.loc))

for(j in 2:15){

out2=cbind(list.f(j,sid.n.loc),list.f(j,tit.loc),list.f(j,nic.loc))
out=rbind(out,out2)
out
}


#for(h in 1:15){

#url=paste0("https://cafe.naver.com/suhui/", list.f(h,sid.n.loc), sep="")

#remDr$navigate(url)

#remDr$switchToFrame("cafe_main")

#Sys.sleep(sample(3:6, 1))



#p=remDr$findElement(using = "css", value ="#main-area > div:nth-child(2)" )
#vl=paste0("#main-area #post_",list.f(h,sid.n.loc),sep="")
#p=remDr$findElement(using = "css", value = vl)

#t=p$getElementText()

#as.character(t)
#tt=strsplit(as.character(t),"이 작성자의 게시글 더보기")[[1]][1]
#tt
#cmt=strsplit(as.character(t),"이 작성자의 게시글 더보기")[[1]][2]
#ttt=strsplit(tt,'https://cafe.naver.com/suhui/')[[1]][2]
#tttt=strsplit(ttt,"\n")[[1]][-1]
#output=cbind(tt,cmt)
#out2=rbind(cbind(c(1),c(2)),output)
#}


write.table(out,"C:/Users/little2/Desktop/tnt.txt",sep = ",",row.names = F,append = T)

}



remDr$close() 




install.packages('devtools')
devtools::install_github('haven-jeon/KoSpacing')
library(KoSpacing)
spacing("김형호라는사람")
