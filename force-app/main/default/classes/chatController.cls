public class chatController {
	@AuraEnabled
    public static List<Post__C> getPosts(){
		List<Post__c> allPosts = [SELECT Owner.name, body__c FROM Post__c];
        return allPosts;
    }
    
    @AuraEnabled
    public static Post__c createPost(String body){
        id userID = UserInfo.getUserId();
        Post__c newPost = new Post__c();
        newPost.OwnerId = userID;
        newPost.body__c = (body);
	 	insert newPost;
        return newPost;
    }
    
}