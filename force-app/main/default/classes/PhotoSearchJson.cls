public class PhotoSearchJson {
    /*
    public class ResponseWrapper {
        public Integer albumId;
        public Integer id;
        public String url;
        public String thumbnailUrl;
        public string title;
    }
    
    @AuraEnabled
    public static list<Photo__c> getPhoto(Integer idphoto) {
        list<Photo__c> Pic =new list<Photo__c>();
        Photo__c P =new Photo__c();
        list<Photo__c> photos = [SELECT Album_id__c, Id__c, ThumbnailURL__c, Title__c, URL__c FROM Photo__c WHERE Id__c =: idphoto];
        system.debug('photos'+photos);        
        if (photos.size() == 0) {
            Http http = new Http();
            //String Endpoint='https://jsonplaceholder.typicode.com/photos?id=';   
            String Endpoint = 'https://jsonplaceholder.typicode.com/photos?id=';
            HttpRequest req = new HttpRequest();
            req.setEndpoint( Endpoint + idphoto);
            req.setMethod('GET');
            HttpResponse res = http.send(req);
            system.debug(' @@@ res ==> ' + res);
            
            if (res.getStatusCode() == 200) {
                String s = res.getBody();
                system.debug('ss'+s);
                List<ResponseWrapper> responseList = (List<ResponseWrapper>) JSON.deserialize(s, List<ResponseWrapper>.class);
                system.debug('we'+responseList);
                
                //system.debug('json'+JSON.stringify(responseList));
                for ( ResponseWrapper value : responseList) {
                    
                    p.Id__c=value.id;
                    p.Album_id__c=value.albumId;
                    p.ThumbnailURL__c=value.thumbnailUrl;
                    p.URL__c=value.url;
                    p.Title__c=value.title;
                    insert p;
                    
                }
                
                
            } 
            list<Photo__c> photosRest = [SELECT Album_id__c, Id__c, ThumbnailURL__c, Title__c, URL__c FROM Photo__c WHERE Id =:p.id];
            system.debug('photosRest'+photosRest);
            return photosRest;
         
        }
        else{
            system.debug('ppppp'+photos);
            return photos;
        }
        
        
    }*/
}