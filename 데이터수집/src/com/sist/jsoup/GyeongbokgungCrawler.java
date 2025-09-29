package com.sist.jsoup;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class GyeongbokgungCrawler {
	public static void main(String[] args) {
        try {
            String url = "https://www.melon.com/chart/index.htm";

            // 1. 접속 (헤더 필수)
            Document doc = Jsoup.connect(url)
                    .header("User-Agent", "Mozilla/5.0")
                    .header("Referer", "https://www.melon.com/")
                    .get();

            // 2. 곡 리스트 선택
            Elements rows = doc.select("tr.lst50, tr.lst100"); 
            // Top 1~50: lst50 / 51~100: lst100

            int rank = 1;
            for (Element row : rows) {
                String title = row.select(".rank01 a").text();
                String artist = row.select(".rank02 a").first().text();
                System.out.printf("%d위 - %s / %s\n", rank, title, artist);
                rank++;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    
    }
}