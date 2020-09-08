import { LightningElement, api, wire } from 'lwc';
import { loadScript } from 'lightning/platformResourceLoader';
import { getRecord, createRecord } from 'lightning/uiRecordApi';
import { refreshApex } from '@salesforce/apex';
////
//socket.io script from our static resources 
import socketScript from '@salesforce/resourceUrl/socketScript';
//userid
import USER_ID from '@salesforce/user/Id';
//WEBSOCKET_SERVER_URL == wss://interviewforcetest.herokuapp.com/
import WEBSOCKET_SERVER_URL from '@salesforce/label/c.websocket_server_url';
//
import POST_OBJECT from '@salesforce/schema/post__c';
import CONTENT_FIELD from '@salesforce/schema/post__c.body__c'
import getPosts from '@salesforce/apex/chatController.getPosts';
import createPost from '@salesforce/apex/chatController.createPost';

export default class WebsocketChat extends LightningElement {
    @api userId = USER_ID;
    @api timeString;
    @api message;   
    @api error;
    @api isTyping = false;

    _socketIoInitialized = false;
    _socket;

    @wire(createPost)
    createPost

    @wire(getPosts)
    getPosts

    /*
    * load the socket io script upon rendering of component.
    */

    renderedCallback(){
        if (this._socketIoInitialized) {
            return;
        }
        this._socketIoInitialized = true;

        Promise.all([
            loadScript(this, socketScript),
        ])
        .then(() => {
            this.initSocketIo();
        })
        .catch(error => {
            // eslint-disable-next-line no-console
            console.error('loadScript error', error);
            this.error = 'Error loading socket.io';
        });
    }
    /* After socket.io has initialized, make our socket connection and register listeners.*/
    initSocketIo(){
        this._socket = io.connect(WEBSOCKET_SERVER_URL);
        const messageInput = this.template.querySelector(".message-input");
        if(this._socket !== undefined){
            if(event.which === 13 && event.shiftKey === false){
                event.preventDefault(); //Prevents the page from refreshing
                debugger;
            }
            //Upon a submission, you would send out a post to be created, then would emit to other users to refresh the page.

        }
    }


}