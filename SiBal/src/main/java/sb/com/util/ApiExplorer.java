package sb.com.util;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

public class ApiExplorer {
    public static String getAirportData(String depAirportId, String arrAirportId, String depPlandTime) throws IOException {
    	//depAirportId = "NAARKSS";
    	//arrAirportId = "NAARKPC";
    	//depPlandTime = "20181127";
        StringBuilder urlBuilder = new StringBuilder("http://openapi.tago.go.kr/openapi/service/DmstcFlightNvgInfoService/getFlightOpratInfoList"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=ZzgPKcfrdL46Znc6aWHPQSTGvxV0raIr%2BYieCjm%2BD5zbTllAnvi6%2BTbwqUh9czCO1OUuVNFPniXPHroT%2Fr7Xaw%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("20", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
        urlBuilder.append("&" + URLEncoder.encode("depAirportId","UTF-8") + "=" + URLEncoder.encode(depAirportId, "UTF-8")); /*출발공항ID*/
        urlBuilder.append("&" + URLEncoder.encode("arrAirportId","UTF-8") + "=" + URLEncoder.encode(arrAirportId, "UTF-8")); /*도착공항ID*/
        urlBuilder.append("&" + URLEncoder.encode("depPlandTime","UTF-8") + "=" + URLEncoder.encode(depPlandTime, "UTF-8")); /*출발일*/
        //urlBuilder.append("&" + URLEncoder.encode("airlineId","UTF-8") + "=" + URLEncoder.encode("AAR", "UTF-8")); /*항공사ID*/
        urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*출발일*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        System.out.println(sb.toString());
        return  sb.toString();
        
        
    }
    
    // Json으로 만들기
    public static List<AirVO> getAirportJson(String depAirportId, String arrAirportId, String depPlandTime) throws Exception {
    	String result = getAirportData(depAirportId, arrAirportId, depPlandTime);
    	// Json형태의 String을 Json으로 만들기03
    	JSONParser parser = new JSONParser();
    	JSONObject jsonObj = (JSONObject) parser.parse(result); 
    	// Object to JSONObject 다운캐스팅. json 처럼 생겨야지만 다운캐스팅 가능..
    	
    	//response
    	JSONObject j_response = (JSONObject) jsonObj.get("response");
//    	System.out.println("j_response 아래------------");
//    	System.out.println(j_response);
    	JSONObject j_body = (JSONObject) j_response.get("body");
//    	System.out.println("j_body 아래------------");
//    	System.out.println(j_body);
    	JSONObject j_items = (JSONObject) j_body.get("items");
//    	System.out.println("j_items 아래----------");
//    	System.out.println(j_items);
    	JSONArray a_item = (JSONArray)j_items.get("item");
//    	System.out.println(a_item);
    	
    	// 1. Gson → 클래스로 변경 : AirVO
    	// Gson gson = new Gson();
    	// gson.fromJson(a_item.toString(), AirVO.class);
    	
    	// 2. Gson → 배열로 변경 : List<AirVO>
    	Gson gson = new Gson();
//    	List<AirVO> list = (List<AirVO>) gson.fromJson(a_item.toString(), AirVO.class);
    	List<AirVO> list = gson.fromJson(a_item.toString(), new TypeToken<List<AirVO>>(){}.getType());
/*    	for(AirVO airVO : list){
    		System.out.println(airVO.getArrPlandTime());
    	}*/
    	
    	return list;
    }
    
}
