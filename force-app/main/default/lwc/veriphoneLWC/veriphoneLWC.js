import { LightningElement, track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
 
export default class VeriphoneLWC extends LightningElement {
    showSpinner = false;
    phoneNumber = '';
    @track result = {};
 
    handlePhoneVerfiy() {
        this.handleSpinner();
        let APIKey = '4B6ED6BADA8648E0Bxxxxxxxxxxxx';
         
        //https://api.veriphone.io/v2/verify?phone=mobile&key=apikey
        var endPoint = 'https://api.veriphone.io/v2/verify?phone=' + this.phoneNumber + '&key=' + APIKey;
        //get request
        fetch(endPoint)
            .then((response) => {
                if (!response.ok) {
                    this.error = response;
                }
                return response.json();
            })
            .then((jsonResponse) => {
                console.log(jsonResponse);
                this.result = jsonResponse;
 
 
                this.handleSpinner();
            })
            .catch((error) => {
                console.log(error);
                this.error = error;
                this.handleSpinner();
            });
    }
 
    handlePhoneNumberChange(event) {
        this.phoneNumber = event.target.value;
    }
 
    handleSpinner() {
        this.showSpinner = !this.showSpinner;
    }
 
    showToast(title, message, variant, mode) {
        const evt = new ShowToastEvent({
            title: title,
            message: message,
            variant: variant,
            mode: mode
        });
        this.dispatchEvent(evt);
    }
}