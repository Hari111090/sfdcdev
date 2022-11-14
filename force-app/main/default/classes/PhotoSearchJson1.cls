public class PhotoSearchJson1 {
    Public Static String Endpoint='https://jsonplaceholder.typicode.com/photos?id=';
    
    @AuraEnabled
    public static List<Photo__c> getPhotos(Integer idphoto) {
       // List<Photo__c> Tempresult= new list<Photo__c>();
        list<Photo__c> photos=[Select Album_id__c,Id__c,ThumbnailURL__c,Title__c,URL__c FROM Photo__c where Id__c =: idphoto];
        if(photos.size() <= 0){
            Http http = new Http();
            HttpRequest req = new HttpRequest();
            req.setEndpoint( Endpoint + idphoto);
            req.setMethod('GET');
            HttpResponse res = http.send(req);
            String json = res.getBody();
            List<PhotoSearchJson1.photoWrap> response =(List<PhotoSearchJson1.photoWrap>) System.JSON.deserialize(json, List<PhotoSearchJson1.photoWrap>.class);
            system.debug( ' Resp ==> ' + response);
            List<Photo__c> photoList = new List<Photo__c>();
            for(PhotoSearchJson1.photoWrap wrap : response)
            {
                Photo__c p = new Photo__c();
                p.Album_id__c = wrap.albumId;
                p.Id__c = wrap.id;
                p.Title__c =  wrap.title;
                p.URL__c = wrap.url;
                p.ThumbnailURL__c =  wrap.thumbnailUrl;
                photoList.add(p);
            }
            
            system.debug( ' photoList ==> ' + photoList );
            
            if(!photoList.IsEmpty())
            {
                insert photoList;
            }
        } 
        
        return [Select Album_id__c,Id__c,ThumbnailURL__c,Title__c,URL__c FROM Photo__c where Id__c =: idphoto];
    }
    
    Public class photoWrap{
        public Integer albumId;
        public Integer id;
        public String title;
        public String url;
        public String thumbnailUrl;
    }
}