#Kutuphaneleri R Studio icerisinde yukleme komutlari
# Bu kısımı R Studio projenizde bir kere calistirmaniz yeterlidir.
install.packages('googleAuthR')
install.packages('googleAnalyticsR')

#Bu uygulamamizda kullanacagimiz kutuphaneler
library(googleAuthR)
library(googleAnalyticsR)

#Analytics Reporting API v4 te verileri okuma iznimiz
options(
   googleAuthR.scopes.selected = c('https://www.googleapis.com/auth/analytics.readonly')
)

#Service Account kismindaki kullanicimiza ait indirdigimiz json dosyasinin yolu ve izinler
#Burada API iznimizi yukarida almistik, burada aldigimiz izini atadigimiz degiskeni yaziyoruz.
gar_auth_service('C:\Users\user\Desktop\\ilab-izin.json',
                 scope = getOption('googleAuthR.scopes.selected'))

#cektigimiz Analytics datasini data frame'e atiyoruz.
ga_data <-
   
   #Analytics'den veriyi cekme komutumuz
   google_analytics(
      "8091545",                                      #Analytics View Id
      date_range = c(Sys.Date() - 1, Sys.Date() - 1), #Tarih Araligi
      metrics = 'sessions',                           #cekmek istedigimiz metrikler
      dimensions = 'channelGrouping',                 #cekmek istedigimiz dimensionlar
      max = -1,                                       #Kac satir veri istedigimizi yaziyoruz
      anti_sample = TRUE,                             #Samplesiz data istegi
      anti_sample_batch = 3                           #Sample yakalamasi durumunda kac tekrar daha yapilsin
   )