//
//  UPOSService.h
//  CordovaLib
//
//  Created by savin on 13. 12. 10..
//
//

#import <Cordova/CDV.h>
#import <frmBixolonUPOS/UPOSPrinterController.h>

@interface BXLService : CDVPlugin<UPOSDeviceControlDelegate>
{
    UPOSPrinterController* posPrinter;
}

-(BOOL) executePrinter:(CDVInvokedUrlCommand *)command;
@end
