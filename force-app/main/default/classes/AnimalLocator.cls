public class AnimalLocator {
    
    public static String getAnimalNameById(Integer n){
		Http http = new Http();
		HttpRequest request = new HttpRequest();
        String animalName = '';
		request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + n);
		request.setMethod('GET');
		HttpResponse response = http.send(request);

        if (response.getStatusCode() == 200) {
            Map<String, Object> result = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
			Map<String, Object> animals = (Map<String, Object>) result.get('animal');
            animalName = string.valueOf(animals.get('name'));
            
        }

        
        return animalName;
    }

}