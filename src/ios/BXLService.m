//
//  UPOSService.m
//  CordovaLib
//
//  Created by savin on 13. 12. 10..
//
//

#define METHOD_ADD_ENTRY                    @"addEntry"
#define METHOD_OPEN                         @"open"
#define METHOD_CLOSE                        @"close"
#define METHOD_CLAIM                        @"claim"
#define METHOD_RELEASE                      @"release"
#define METHOD_CHECK_HEALTH                 @"checkHealth"
#define METHOD_CUT_PAPER                    @"cutPaper"
#define METHOD_MARK_FFED                    @"markFeed"
#define METHOD_PAGE_MODE_PRINT              @"pageModePrint"
#define METHOD_PRINT_BAR_CODE               @"printBarCode"
#define METHOD_PRINT_BITMAP                 @"printBitmap"
#define METHOD_PRINT_BITMAP_WITH_BASE64     @"printBitmapWithBase64"
#define METHOD_PRINT_IMMEDIATE              @"printImmediate"
#define METHOD_PRINT_NORMAL                 @"printNormal"
#define METHOD_TRANSACTION_PRINT            @"transactionPrint"
#define METHOD_GET_CLAIMED                  @"getClaimed"
#define METHOD_GET_DEVICE_ENABLED           @"getDeviceEnabled"
#define METHOD_SET_DEVICE_ENABLED           @"setDeviceEnabled"
#define METHOD_GET_FREEZE_EVENTS            @"getFreezeEvents"
#define METHOD_SET_FREEZE_EVENTS            @"setFreezeEvents"
#define METHOD_GET_STATE                    @"getState"
#define METHOD_GET_DEVICE_SERVICE_DESCRIPTION      @"getDeviceServiceDescription"
#define METHOD_GET_DEVICE_SERVICE_VERSION   @"getDeviceServiceVersion"
#define METHOD_GET_PHYSICAL_DEVICE_DESCRIPTION     @"getPhysicalDeviceDescription"
#define METHOD_GET_PHYSICAL_DEVICE_NAME     @"getPhysicalDeviceName"
#define METHOD_GET_CAP_CHARACTER_SET        @"getCapCharacterSet"
#define METHOD_GET_CAP_COVER_SENSOR         @"getCapCoverSensor"
#define METHOD_GET_CAP_REC_BAR_CODE         @"getCapRecBarCode"
#define METHOD_GET_CAP_REC_BITMAP           @"getCapRecBitmap"
#define METHOD_GET_CAP_REC_BOLD             @"getCapRecBold"
#define METHOD_GET_CAP_REC_DHIGH            @"getCapRecDhigh"
#define METHOD_GET_CAP_REC_DWIDE            @"getCapRecDwide"
#define METHOD_GET_CAP_REC_DWIDE_DHIGH      @"getCapRecDwideDhigh"
#define METHOD_GET_CAP_REC_EMPTY_SENSOR     @"getCapRecEmptySensor"
#define METHOD_GET_CAP_REC_ITALIC           @"getCapRecItalic"
#define METHOD_GET_CAP_REC_NEAR_END_SENSOR  @"getCapRecNearEndSensor"
#define METHOD_GET_CAP_REC_PAPERCUT         @"getCapRecPapercut"
#define METHOD_GET_CAP_REC_PRESENT          @"getCapRecPresent"
#define METHOD_GET_CAP_REC_UNDERLINE        @"getCapRecUnderline"
#define METHOD_GET_CAP_TRANSACTION          @"getCapTransaction"
#define METHOD_GET_ASYNC_MODE               @"getAsyncMode"
#define METHOD_SET_ASYNC_MODE               @"setAsyncMode"
#define METHOD_GET_CHARACTER_SET            @"getCharacterSet"
#define METHOD_SET_CHARACTER_SET            @"setCharacterSet"
#define METHOD_GET_CHARACTER_SET_LIST       @"getCharacterSetList"
#define METHOD_GET_COVER_OPEN               @"getCoverOpen"
#define METHOD_GET_ERROR_LEVEL              @"getErrorLevel"
#define METHOD_GET_ERROR_STATION            @"getErrorStation"
#define METHOD_GET_ERROR_STRING             @"getErrorString"
#define METHOD_GET_FLAG_WHEN_IDLE           @"getFlagWhenIdle"
#define METHOD_SET_FLAG_WHEN_IDLE           @"setFlagWhenIdle"
#define METHOD_GET_MAP_MODE                 @"getMapMode"
#define METHOD_SET_MAP_MODE                 @"setMapMode"
#define METHOD_GET_OUTPUT_ID                @"getOutputID"
#define METHOD_GET_REC_EMPTY                @"getRecEmpty"
#define METHOD_GET_REC_NEAR_END             @"getRecNearEnd"
#define METHOD_GET_CAP_POWER_REPORTING      @"getCapPowerReporting"
#define METHOD_GET_POWER_NOTIFY             @"getPowerNotify"
#define METHOD_SET_POWER_NOTIFY             @"setPowerNotify"
#define METHOD_GET_POWER_STATE              @"getPowerState"
#define METHOD_GET_CAP_REC_MARK_FEED        @"getCapRecMarkFeed"
#define METHOD_GET_CAP_MAP_CHARACTER_SET    @"getCapMapCharacterSet"
#define METHOD_GET_MAP_CHARACTER_SET        @"getMapCharacterSet"
#define METHOD_SET_MAP_CHARACTER_SET        @"setMapCharacterSet"
#define METHOD_GET_CAP_REC_PAGE_MODE        @"getCapRecPageMode"
#define METHOD_GET_PAGE_MODE_AREA           @"getPageModeArea"
#define METHOD_GET_PAGE_MODE_DESCRIPTOR     @"getPageModeDescriptor"
#define METHOD_GET_PAGE_MODE_HORIZONTAL_POSITION     @"getPageModeHorizontalPosition"
#define METHOD_SET_PAGE_MODE_HORIZONTAL_POSITION     @"setPageModeHorizontalPosition"
#define METHOD_GET_PAGE_MODE_PRINT_AREA     @"getPageModePrintArea"
#define METHOD_SET_PAGE_MODE_PRINT_AREA     @"setPageModePrintArea"
#define METHOD_GET_PAGE_MODE_PRINT_DIRECTION     @"getPageModePrintDirection"
#define METHOD_SET_PAGE_MODE_PRINT_DIRECTION     @"setPageModePrintDirection"
#define METHOD_GET_PAGE_MODE_STATION        @"getPageModeStation"
#define METHOD_SET_PAGE_MODE_STATION        @"setPageModeStation"
#define METHOD_GET_PAGE_MODE_VERTICAL_POSITION     @"getPageModeVerticalPosition"
#define METHOD_SET_PAGE_MODE_VERTICAL_POSITION     @"setPageModeVerticalPosition"
#define METHOD_CLEAR_PRINT_AREA             @"clearPrintArea"
#define METHOD_GET_PAIRED_DEVICE            @"getPairedDevice"
#define METHOD_GET_PRINTER_STATUS            @"getPrinterStatus"
#define METHOD_DIRECT_IO            @"directIO"


#import "BXLService.h"

@implementation BXLService
{
    NSInteger currentStatus;
}

//-(BOOL) execute:(NSString*) action
//           args:(NSMutableArray*)args
//

-(void) callback:(NSString*) callbackID
       isSuccess:(BOOL)isSuccess
{
    CDVPluginResult *pluginResult = [ CDVPluginResult
                                     resultWithStatus    : (isSuccess?CDVCommandStatus_OK:CDVCommandStatus_ERROR)
                                     ];
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:callbackID];
}
-(void) callback:(NSString*) callbackID
       isSuccess:(BOOL)isSuccess
  WithMessageInt:(NSInteger)value
{
    CDVPluginResult *pluginResult = [ CDVPluginResult
                                     resultWithStatus    : (isSuccess?CDVCommandStatus_OK:CDVCommandStatus_ERROR)
                                     messageAsInt:value
                                     ];
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:callbackID];
}

-(void) callback:(NSString*) callbackID
       isSuccess:(BOOL)isSuccess
WithMessageString:(NSString*)value
{
    CDVPluginResult *pluginResult = [ CDVPluginResult
                                     resultWithStatus    : (isSuccess?CDVCommandStatus_OK:CDVCommandStatus_ERROR)
                                     messageAsString:value
                                     ];
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:callbackID];
}


- (UIImage *)decodeBase64ToImage:(NSString *)strEncodeData {
    NSData *data = [[NSData alloc]initWithBase64EncodedString:strEncodeData options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return [UIImage imageWithData:data];
}

-(void)StatusUpdateEvent:(NSNumber*) Status
{
    NSLog(@"!!!!!!!!!!!!  StatusUpdateEvent : %ld !!!!!!!!!!!", (long)Status.integerValue);
    
    //    currentStatus  = 0;
    if([Status integerValue] == PTR_SUE_COVER_OPEN){
        currentStatus = (currentStatus | 1);
    }
    if([Status integerValue] == PTR_SUE_COVER_OK){
        currentStatus = (currentStatus & ~1);
    }
    if([Status integerValue] == PTR_SUE_REC_EMPTY){
        currentStatus = (currentStatus | 2);
    }
    if([Status integerValue] == PTR_SUE_REC_PAPEROK){
        currentStatus = (currentStatus & ~2);
        currentStatus = (currentStatus & ~4);
    }
    if([Status integerValue] == PTR_SUE_REC_NEAREMPTY){
        currentStatus = (currentStatus | 4);
    }
    if([Status integerValue] == UPOS_SUE_POWER_OFF ||
       [Status integerValue] == UPOS_SUE_POWER_OFF_OFFLINE ||
       [Status integerValue] == UPOS_SUE_POWER_OFFLINE) {
        currentStatus = (currentStatus | 32);
    }
    if([Status integerValue] == UPOS_SUE_POWER_ONLINE){
        currentStatus = (currentStatus & ~32);
    }
    if([Status integerValue] == PTR_SUE_REC_BATTERY_NORMAL){
        //        currentStatus = 0;
    }
    if([Status integerValue] == PTR_SUE_REC_BATTERY_LOW){
        //        currentStatus = 0;
    }
    
    
}

-(BOOL) executePrinter:(CDVInvokedUrlCommand *)command
{
    //        NSLog(@"object count : %d", [command.arguments count]);
    //
    //        for (int nIndex = 0; nIndex<[command.arguments count]; nIndex++)
    //        {
    //            NSLog(@"object[%d] - %@", nIndex, [command.arguments objectAtIndex:nIndex]);
    //        }
    
    /********
     CDVPluginResult* pluginResult = nil;
     NSString* myarg = [command.arguments objectAtIndex:0];
     
     if (myarg != nil) {
     pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
     } else {
     pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Arg was null"];
     }
     [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
     
     *************/
    //    NSLog(@"args : %@", args);
    NSString* action;
    NSMutableArray* args = [NSMutableArray array];
    
    action = [command.arguments objectAtIndex:0];
    
    for (int nIndex = 1; nIndex<[command.arguments count]; nIndex++)
    {
        [args addObject:[command.arguments objectAtIndex:nIndex]];
    }
    
    
    @try {
        
        NSInteger     result = -1;
        //////////
        //    프린터 객체가 생성되지 않은 경우 새로 생성.
        if(posPrinter == nil)
        {
            posPrinter = [[UPOSPrinterController alloc] init];
        }
        
        posPrinter.delegate = self;
        if([action isEqualToString:METHOD_GET_PAIRED_DEVICE])
        {
            UPOSPrinterController* prtTemp = [[UPOSPrinterController alloc] init];
            NSMutableArray* printerList = [[NSMutableArray alloc] init];
            id obsFound = [[NSNotificationCenter defaultCenter] addObserverForName:__NOTIFICATION_NAME_BT_FOUND_PRINTER_
                                                                            object:nil
                                                                             queue:nil
                                                                        usingBlock:^(NSNotification *notification) {
                                                                            UPOSPrinter* lookupDevice = (UPOSPrinter*)[[notification userInfo] objectForKey:__NOTIFICATION_NAME_BT_FOUND_PRINTER_];
                                                                            
                                                                            
                                                                            NSDictionary* dic = [NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"%@", lookupDevice.modelName], @"modelName", [NSString stringWithFormat:@"%@", lookupDevice.serialNumber], @"address", nil];
                                                                            [printerList addObject:dic];
                                                                            
                                                                        }];
            
            id obsFinish = [[NSNotificationCenter defaultCenter] addObserverForName:__NOTIFICATION_NAME_BT_LOOKUP_COMPLETE_
                                                                             object:nil
                                                                              queue:nil
                                                                         usingBlock:^(NSNotification *notification) {
                                                                             
                                                                             NSLog(@"printerList : %@", printerList);
                                                                             
                                                                             NSMutableString *jsonString = [NSMutableString string]; //[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
                                                                             
                                                                             for(NSDictionary *p in printerList)
                                                                             {
                                                                                 if(jsonString.length>3)
                                                                                     [jsonString appendString:@","];
                                                                                 NSError *writeError = nil;
                                                                                 NSData *jsonData = [NSJSONSerialization dataWithJSONObject:p options:NSJSONWritingPrettyPrinted error:&writeError];
                                                                                 [jsonString appendString:[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]];
                                                                             }
                                                                             
                                                                             
                                                                             
                                                                             [[NSNotificationCenter defaultCenter] removeObserver:obsFound];
                                                                             [[NSNotificationCenter defaultCenter] removeObserver:obsFinish];
                                                                             
                                                                             
                                                                             [self callback:command.callbackId isSuccess:YES WithMessageString:jsonString];
                                                                             
                                                                             
                                                                             
                                                                         }];
            
            [prtTemp refreshBTLookup];
            
            
            //                [[NSNotificationCenter defaultCenter] addObserver:[^(NSNotification* notification) {
            //                    [[NSNotificationCenter defaultCenter] removeObserver:self];
            //
            //                } copy] selector:@selector(invoke) name:__NOTIFICATION_NAME_BT_LOOKUP_COMPLETE_ object:nil];
            
            
            //            });
            
            
            
            return true;
        }
        
        else
        {
            
            //            //  프린터 객체 생성 여부 체크 및 필요한 파라미터 갯수 체크
            //            if(posPrinter == nil)
            //            {
            //                //            [self callback:command.callbackId isSuccess:NO];
            //                //            return false;
            //
            //                result = UPOS_E_CLOSED;
            //            }
            
            //            else
            {
                
                
                if ([action isEqualToString:METHOD_OPEN])
                {
                    //  필요한 파라미터 갯수 체크
                    if([args count] <= 0)
                    {
                        [self callback:command.callbackId isSuccess:NO];
                    }
                    result = [posPrinter open:[args objectAtIndex:0]];
                    //            [self callback:command.callbackId isSuccess:YES];
                    
                    //            return true;
                }
                else if ([action isEqualToString:METHOD_ADD_ENTRY])
                {
                    //  프린터 객체 생성 여부 체크 및 필요한 파라미터 갯수 체크
                    if([args count] <= 2)
                    {
                        [self callback:command.callbackId isSuccess:NO];
                    }
                    
                    else
                    {
                        
                        UPOSPrinter* device  = [[UPOSPrinter alloc] init];
                        device.modelName    = [NSString stringWithFormat:@"%@", [args objectAtIndex:0]];//[printerItems objectAtIndex:0]];
                        //                device.devClass     = [NSString stringWithFormat:@"%@", [printerItems objectAtIndex:2]];
                        NSString* stringTemp = [NSString stringWithFormat:@"%@",[args objectAtIndex:1]]; //[printerItems objectAtIndex:2]] ;
                        NSInteger ifType = [stringTemp integerValue];
                        switch (ifType) {
                            case 0:
                                ifType = _INTERFACETYPE_BLUETOOTH;
                                break;
                            case 1:
                                ifType = _INTERFACETYPE_ETHERNET;
                                break;
                            case 2: // USB
                                //                            ifType = _INTERFACETYPE_BLUETOOTH;
                                [self callback:command.callbackId isSuccess:NO];
                                break;
                            case 3:
                                ifType = _INTERFACETYPE_WIFI;
                                break;
                                
                            case 4: // WIFI Direct
                            default:
                                [self callback:command.callbackId isSuccess:NO];
                                break;
                                
                        }
                        device.interfaceType = [NSNumber numberWithInteger:ifType];
                        NSString* strTemp = [NSString stringWithFormat:@"%@", [args objectAtIndex:2]];
                        NSArray*  arrayTemp_dot = [strTemp  componentsSeparatedByString:@"."];
                        NSArray*  arrayTemp_colon = [strTemp  componentsSeparatedByString:@":"];
                        if( (arrayTemp_dot&&arrayTemp_dot.count>3) || (arrayTemp_colon&&arrayTemp_colon.count>=2) )
                            device.address      = [NSString stringWithFormat:@"%@", strTemp]; //[printerItems objectAtIndex:3]];
                        else
                            device.serialNumber      = [NSString stringWithFormat:@"%@", [args objectAtIndex:2]]; //[printerItems objectAtIndex:3]];
                        
                        if([args count] >=4)
                            device.ldn          = [NSString stringWithFormat:@"%@", [args objectAtIndex:3]];//[printerItems objectAtIndex:1]];
                        
                        UPOSPrinters *deviceList =  (UPOSPrinters*)[posPrinter getRegisteredDevice];
                        [deviceList removeDevice:device];
                        [deviceList addDevice:device];
                        [deviceList save];
                        
                        [self callback:command.callbackId isSuccess:YES];
                        
                    }
                }
                else if ([action isEqualToString:METHOD_GET_CLAIMED])
                {
                    [self callback:command.callbackId isSuccess:YES WithMessageInt:[posPrinter Claimed]];
                }
                else if ([action isEqualToString:METHOD_GET_DEVICE_ENABLED])
                {
                    [self callback:command.callbackId isSuccess:YES WithMessageInt:[posPrinter DeviceEnabled]];
                }
                else if ([action isEqualToString:METHOD_SET_DEVICE_ENABLED])
                {
                    //  프린터 객체 생성 여부 체크 및 필요한 파라미터 갯수 체크
                    if([args count] <= 0)
                    {
                        [self callback:command.callbackId isSuccess:NO];
                    }
                    
                    else
                    {
                        [posPrinter setDeviceEnabled:[[args objectAtIndex:0]  boolValue] ];
                        [self callback:command.callbackId isSuccess:YES];
                    }
                }
                else if ([action isEqualToString:METHOD_GET_FREEZE_EVENTS])
                {
                    [self callback:command.callbackId isSuccess:YES WithMessageInt:[posPrinter FreezeEvents]];
                }
                else if ([action isEqualToString:METHOD_SET_FREEZE_EVENTS])
                {
                    //  프린터 객체 생성 여부 체크 및 필요한 파라미터 갯수 체크
                    if([args count] <= 0)
                    {
                        [self callback:command.callbackId isSuccess:NO];
                    }
                    
                    else
                    {
                        [posPrinter setFreezeEvents: [[args objectAtIndex:0] boolValue] ];
                        [self callback:command.callbackId isSuccess:YES];
                    }
                }
                else if ([action isEqualToString:METHOD_GET_STATE])
                {
                    [self callback:command.callbackId isSuccess:YES WithMessageInt:[posPrinter State]];
                }
                else if ([action isEqualToString:METHOD_GET_DEVICE_SERVICE_DESCRIPTION])
                {
                    [self callback:command.callbackId isSuccess:YES WithMessageString:[posPrinter DeviceServiceDescription]];
                }
                else if ([action isEqualToString:METHOD_GET_DEVICE_SERVICE_VERSION])
                {
                    [self callback:command.callbackId isSuccess:YES WithMessageInt:[posPrinter DeviceServiceVersion]];
                    
                }
                else if ([action isEqualToString:METHOD_GET_PHYSICAL_DEVICE_DESCRIPTION])
                {
                    [self callback:command.callbackId isSuccess:YES WithMessageString:[posPrinter PhysicalDeviceDescription]];
                    
                }
                else if ([action isEqualToString:METHOD_GET_PHYSICAL_DEVICE_NAME])
                {
                    [self callback:command.callbackId isSuccess:YES WithMessageString:[posPrinter PhysicalDeviceName]];
                }
                else if ([action isEqualToString:METHOD_GET_CAP_CHARACTER_SET])
                {
                    [self callback:command.callbackId isSuccess:YES WithMessageInt:[posPrinter CapCharacterSet]];
                }
                else if ([action isEqualToString:METHOD_GET_CAP_COVER_SENSOR])
                {
                    [self callback:command.callbackId isSuccess:YES WithMessageInt:[posPrinter CapCoverSensor]];
                }
                else if ([action isEqualToString:METHOD_GET_CAP_REC_BAR_CODE])
                {
                    [self callback:command.callbackId isSuccess:YES WithMessageInt:[posPrinter CapRecBarCode]];
                }
                else if ([action isEqualToString:METHOD_GET_CAP_REC_BITMAP])
                {
                    [self callback:command.callbackId isSuccess:YES WithMessageInt:[posPrinter CapRecBitmap]];
                }
                else if ([action isEqualToString:METHOD_GET_CAP_REC_BOLD])
                {
                    [self callback:command.callbackId isSuccess:YES WithMessageInt:[posPrinter CapRecBold]];
                }
                else if ([action isEqualToString:METHOD_GET_CAP_REC_DHIGH])
                {
                    [self callback:command.callbackId isSuccess:YES WithMessageInt:[posPrinter CapRecDhigh]];
                }
                else if ([action isEqualToString:METHOD_GET_CAP_REC_DWIDE])
                {
                    [self callback:command.callbackId isSuccess:YES WithMessageInt:[posPrinter CapRecDwide]];
                }
                else if ([action isEqualToString:METHOD_GET_CAP_REC_DWIDE_DHIGH])
                {
                    [self callback:command.callbackId isSuccess:YES WithMessageInt:[posPrinter CapRecDwideDhigh]];
                }
                else if ([action isEqualToString:METHOD_GET_CAP_REC_EMPTY_SENSOR])
                {
                    [self callback:command.callbackId isSuccess:YES WithMessageInt:[posPrinter CapRecEmptySensor]];
                }
                else if ([action isEqualToString:METHOD_GET_CAP_REC_ITALIC])
                {
                    [self callback:command.callbackId isSuccess:YES WithMessageInt:[posPrinter CapRecItalic]];
                }
                else if ([action isEqualToString:METHOD_GET_CAP_REC_NEAR_END_SENSOR])
                {
                    [self callback:command.callbackId isSuccess:YES WithMessageInt:[posPrinter CapRecNearEndSensor]];
                }
                else if ([action isEqualToString:METHOD_GET_CAP_REC_PAPERCUT])
                {
                    [self callback:command.callbackId isSuccess:YES WithMessageInt:[posPrinter CapRecPapercut]];
                }
                else if ([action isEqualToString:METHOD_GET_CAP_REC_PRESENT])
                {
                    [self callback:command.callbackId isSuccess:YES WithMessageInt:[posPrinter CapRecPresent]];
                }
                else if ([action isEqualToString:METHOD_GET_CAP_REC_UNDERLINE])
                {
                    [self callback:command.callbackId isSuccess:YES WithMessageInt:[posPrinter CapRecUnderline]];
                }
                else if ([action isEqualToString:METHOD_GET_CAP_TRANSACTION])
                {
                    [self callback:command.callbackId isSuccess:YES WithMessageInt:[posPrinter CapTransaction]];
                }
                else if ([action isEqualToString:METHOD_GET_ASYNC_MODE])
                {
                    [self callback:command.callbackId isSuccess:YES WithMessageInt:[posPrinter AsyncMode]];
                }
                else if ([action isEqualToString:METHOD_GET_CHARACTER_SET])
                {
                    [self callback:command.callbackId isSuccess:YES WithMessageInt:[posPrinter CharacterSet]];
                }
                else if ([action isEqualToString:METHOD_SET_CHARACTER_SET])
                {
                    [self callback:command.callbackId isSuccess:YES WithMessageInt:[posPrinter CharacterSet]];
                }
                else if ([action isEqualToString:METHOD_GET_CHARACTER_SET_LIST])
                {
                    [self callback:command.callbackId isSuccess:YES WithMessageString:[posPrinter CharacterSetList]];
                }
                else if ([action isEqualToString:METHOD_GET_COVER_OPEN])
                {
                    [self callback:command.callbackId isSuccess:YES WithMessageInt:[posPrinter CoverOpen]];
                }
                else if ([action isEqualToString:METHOD_GET_ERROR_LEVEL])
                {
                    [self callback:command.callbackId isSuccess:YES WithMessageInt:[posPrinter ErrorLevel]];
                }
                else if ([action isEqualToString:METHOD_GET_ERROR_STATION])
                {
                    [self callback:command.callbackId isSuccess:YES WithMessageInt:[posPrinter ErrorStation]];
                }
                else if ([action isEqualToString:METHOD_GET_ERROR_STRING])
                {
                    [self callback:command.callbackId isSuccess:YES WithMessageString:[posPrinter ErrorString]];
                }
                else if ([action isEqualToString:METHOD_GET_FLAG_WHEN_IDLE])
                {
                    [self callback:command.callbackId isSuccess:YES WithMessageInt:[posPrinter FlagWhenIdle]];
                }
                else if ([action isEqualToString:METHOD_GET_MAP_MODE])
                {
                    [self callback:command.callbackId isSuccess:YES WithMessageInt:[posPrinter MapMode]];
                }
                else if ([action isEqualToString:METHOD_GET_OUTPUT_ID])
                {
                    [self callback:command.callbackId isSuccess:YES WithMessageInt:[posPrinter OutputID]];
                }
                else if ([action isEqualToString:METHOD_GET_REC_EMPTY])
                {
                    [self callback:command.callbackId isSuccess:YES WithMessageInt:[posPrinter RecEmpty]];
                }
                else if ([action isEqualToString:METHOD_GET_REC_NEAR_END])
                {
                    [self callback:command.callbackId isSuccess:YES WithMessageInt:[posPrinter RecNearEnd]];
                }
                else if ([action isEqualToString:METHOD_GET_CAP_POWER_REPORTING])
                {
                    [self callback:command.callbackId isSuccess:YES WithMessageInt:[posPrinter CapPowerReporting]];
                }
                else if ([action isEqualToString:METHOD_GET_POWER_NOTIFY])
                {
                    [self callback:command.callbackId isSuccess:YES WithMessageInt:[posPrinter PowerNotify]];
                }
                else if ([action isEqualToString:METHOD_GET_POWER_STATE])
                {
                    [self callback:command.callbackId isSuccess:YES WithMessageInt:[posPrinter PowerState]];
                }
                else if ([action isEqualToString:METHOD_GET_CAP_REC_MARK_FEED])
                {
                    [self callback:command.callbackId isSuccess:YES WithMessageInt:[posPrinter CapRecMarkFeed]];
                }
                else if ([action isEqualToString:METHOD_GET_CAP_MAP_CHARACTER_SET])
                {
                    [self callback:command.callbackId isSuccess:YES WithMessageInt:[posPrinter CapMapCharacterSet]];
                }
                else if ([action isEqualToString:METHOD_GET_MAP_CHARACTER_SET])
                {
                    [self callback:command.callbackId isSuccess:YES WithMessageInt:[posPrinter MapCharacterSet]];
                }
                else if ([action isEqualToString:METHOD_GET_CAP_REC_PAGE_MODE])
                {
                    [self callback:command.callbackId isSuccess:YES WithMessageInt:[posPrinter CapRecPageMode]];
                }
                else if ([action isEqualToString:METHOD_GET_PAGE_MODE_AREA])
                {
                    [self callback:command.callbackId isSuccess:YES WithMessageString:[posPrinter PageModeArea]];
                }
                else if ([action isEqualToString:METHOD_GET_PAGE_MODE_DESCRIPTOR])
                {
                    [self callback:command.callbackId isSuccess:YES WithMessageInt:[posPrinter PageModeDescriptor]];
                }
                else if ([action isEqualToString:METHOD_GET_PAGE_MODE_HORIZONTAL_POSITION])
                {
                    [self callback:command.callbackId isSuccess:YES WithMessageInt:[posPrinter PageModeHorizontalPosition]];
                }
                else if ([action isEqualToString:METHOD_GET_PAGE_MODE_PRINT_AREA])
                {
                    [self callback:command.callbackId isSuccess:YES WithMessageString:[posPrinter PageModeArea]];
                }
                else if ([action isEqualToString:METHOD_GET_PAGE_MODE_PRINT_DIRECTION])
                {
                    [self callback:command.callbackId isSuccess:YES WithMessageInt:[posPrinter PageModePrintDirection]];
                }
                else if ([action isEqualToString:METHOD_GET_PAGE_MODE_STATION])
                {
                    [self callback:command.callbackId isSuccess:YES WithMessageInt:[posPrinter PageModeStation]];
                }
                else if ([action isEqualToString:METHOD_GET_PAGE_MODE_VERTICAL_POSITION])
                {
                    [self callback:command.callbackId isSuccess:YES WithMessageInt:[posPrinter PageModeVerticalPosition]];
                }
                else if ([action isEqualToString:METHOD_CLEAR_PRINT_AREA])
                {
                    [self callback:command.callbackId isSuccess:NO];
                }
                else if ([action isEqualToString:METHOD_SET_ASYNC_MODE])
                {
                    //  프린터 객체 생성 여부 체크 및 필요한 파라미터 갯수 체크
                    if([args count] <= 0)
                    {
                        [self callback:command.callbackId isSuccess:NO];
                    }
                    
                    else
                    {
                        [posPrinter setAsyncMode: [[args objectAtIndex:0] boolValue] ];
                        [self callback:command.callbackId isSuccess:YES];
                    }
                    
                }
                else if ([action isEqualToString:METHOD_SET_FLAG_WHEN_IDLE])
                {
                    //  프린터 객체 생성 여부 체크 및 필요한 파라미터 갯수 체크
                    if([args count] <= 0)
                    {
                        [self callback:command.callbackId isSuccess:NO];
                    }
                    
                    else
                    {
                        [posPrinter setFlagWhenIdle: [[args objectAtIndex:0] boolValue] ];
                        [self callback:command.callbackId isSuccess:YES];
                    }
                }
                else if ([action isEqualToString:METHOD_SET_MAP_MODE])
                {
                    //  프린터 객체 생성 여부 체크 및 필요한 파라미터 갯수 체크
                    if([args count] <= 0)
                    {
                        [self callback:command.callbackId isSuccess:NO];
                    }
                    
                    else
                    {
                        [posPrinter setMapMode:[[args objectAtIndex:0] integerValue] ];
                        [self callback:command.callbackId isSuccess:YES];
                    }
                }
                
                else if ([action isEqualToString:METHOD_SET_POWER_NOTIFY])
                {
                    
                    //  프린터 객체 생성 여부 체크 및 필요한 파라미터 갯수 체크
                    if([args count] <= 0)
                    {
                        [self callback:command.callbackId isSuccess:NO];
                    }
                    
                    else
                    {
                        [posPrinter setPowerNotify: [[args objectAtIndex:0] boolValue] ];
                        [self callback:command.callbackId isSuccess:YES];
                    }
                    
                }
                
                else if ([action isEqualToString:METHOD_SET_MAP_CHARACTER_SET])
                {
                    //  프린터 객체 생성 여부 체크 및 필요한 파라미터 갯수 체크
                    if([args count] <= 0)
                    {
                        [self callback:command.callbackId isSuccess:NO];
                    }
                    
                    else
                    {
                        [posPrinter setMapCharacterSet: [[args objectAtIndex:0] boolValue] ];
                        [self callback:command.callbackId isSuccess:YES];
                    }
                }
                
                else if ([action isEqualToString:METHOD_SET_PAGE_MODE_PRINT_AREA])
                {
                    
                    //  프린터 객체 생성 여부 체크 및 필요한 파라미터 갯수 체크
                    if([args count] <= 0)
                    {
                        [self callback:command.callbackId isSuccess:NO];
                    }
                    
                    else
                    {
                        NSArray* array = [args objectAtIndex:0];
                        int area[] = {0,0,0,0};
                        for( int i=0; i<array.count; i++){
                            NSNumber* number = [array objectAtIndex:i];
                            int byte = number.integerValue;
                            area[i] = byte;
                            if(i > (sizeof(area)/sizeof(area[0])))
                                break;
                        }
                        
                        if(array.count<4){
                            [self callback:command.callbackId isSuccess:NO];
                        }
                        else{
                            
                            [posPrinter setPageArea:area[0]
                                          startingY:area[1]
                                              width:area[2]
                                             height:area[3]];
                            [self callback:command.callbackId isSuccess:YES];
                        }
                    }
                }
                else if ([action isEqualToString:METHOD_SET_PAGE_MODE_PRINT_DIRECTION])
                {
                    //  프린터 객체 생성 여부 체크 및 필요한 파라미터 갯수 체크
                    if([args count] <= 0)
                    {
                        [self callback:command.callbackId isSuccess:NO];
                    }
                    
                    else
                    {
                        [posPrinter setPageModeDirection:[[args objectAtIndex:0] integerValue]];
                        [self callback:command.callbackId isSuccess:YES];
                    }
                }
                
                else if ([action isEqualToString:METHOD_SET_PAGE_MODE_HORIZONTAL_POSITION])
                {
                    //  프린터 객체 생성 여부 체크 및 필요한 파라미터 갯수 체크
                    if([args count] <= 0)
                    {
                        [self callback:command.callbackId isSuccess:NO];
                    }
                    
                    else
                    {
                        [posPrinter setLeftPosition:[[args objectAtIndex:0] integerValue]];
                        [self callback:command.callbackId isSuccess:YES];
                    }
                    
                }
                else if ([action isEqualToString:METHOD_SET_PAGE_MODE_STATION])
                {
                    //  프린터 객체 생성 여부 체크 및 필요한 파라미터 갯수 체크
                    [self callback:command.callbackId isSuccess:NO];
                }
                else if ([action isEqualToString:METHOD_SET_PAGE_MODE_VERTICAL_POSITION])
                {
                    //  프린터 객체 생성 여부 체크 및 필요한 파라미터 갯수 체크
                    if([args count] <= 0)
                    {
                        [self callback:command.callbackId isSuccess:NO];
                    }
                    
                    else
                    {
                        [posPrinter setVerticalPosition:[[args objectAtIndex:0] integerValue]];
                        [self callback:command.callbackId isSuccess:YES];
                    }
                }
                else
                {
                    
                    result = -1;
                    if ([action isEqualToString:METHOD_CLOSE])
                    {
                        result = [posPrinter close];
                        //[self callback:command.callbackId isSuccess:YES];
                        
                    }
                    else if ([action isEqualToString:METHOD_CLAIM])
                    {
                        if([args count] <= 0)
                        {
                            [self callback:command.callbackId isSuccess:NO];
                        }
                        
                        else
                        {
                            result = [posPrinter claim:[[args objectAtIndex:0] integerValue]];
                            //[self callback:command.callbackId isSuccess:YES];
                        }
                    }
                    else if ([action isEqualToString:METHOD_RELEASE])
                    {
                        result = [posPrinter releaseDevice];
                        //[self callback:command.callbackId isSuccess:YES];
                        
                    }
                    else if ([action isEqualToString:METHOD_CHECK_HEALTH])
                    {
                        //  프린터 객체 생성 여부 체크 및 필요한 파라미터 갯수 체크
                        if([args count] <= 0)
                        {
                            [self callback:command.callbackId isSuccess:NO];
                        }
                        
                        else
                        {
                            result = [posPrinter checkHealth:[[args objectAtIndex:0] integerValue]];
                            //[self callback:command.callbackId isSuccess:YES];
                        }
                    }
                    else if ([action isEqualToString:METHOD_CUT_PAPER])
                    {
                        //  프린터 객체 생성 여부 체크 및 필요한 파라미터 갯수 체크
                        if([args count] <= 0)
                        {
                            [self callback:command.callbackId isSuccess:NO];
                        }
                        
                        else
                        {
                            result = [posPrinter cutPaper:[[args objectAtIndex:0] integerValue]];
                            //[self callback:command.callbackId isSuccess:YES];
                        }
                    }
                    else if ([action isEqualToString:METHOD_MARK_FFED])
                    {
                        //  프린터 객체 생성 여부 체크 및 필요한 파라미터 갯수 체크
                        if([args count] <= 0)
                        {
                            [self callback:command.callbackId isSuccess:NO];
                        }
                        
                        else
                        {
                            result = [posPrinter markFeed:[[args objectAtIndex:0] integerValue]];
                            //[self callback:command.callbackId isSuccess:YES];
                        }
                    }
                    else if ([action isEqualToString:METHOD_PAGE_MODE_PRINT])
                    {
                        //  프린터 객체 생성 여부 체크 및 필요한 파라미터 갯수 체크
                        if([args count] <= 0)
                        {
                            [self callback:command.callbackId isSuccess:NO];
                        }
                        
                        else
                        {
                            if([[args objectAtIndex:0] integerValue] == 0){
                                [posPrinter printDataInPageMode];
                            }
                            [self callback:command.callbackId isSuccess:YES];
                        }
                    }
                    else if ([action isEqualToString:METHOD_PRINT_BAR_CODE])
                    {
                        //  프린터 객체 생성 여부 체크 및 필요한 파라미터 갯수 체크
                        if([args count] <= 6)
                        {
                            [self callback:command.callbackId isSuccess:NO];
                        }
                        
                        else
                        {
                            result = [posPrinter printBarcode:[[args objectAtIndex:0] integerValue]
                                                         data: [args objectAtIndex:1]
                                                    symbology:[[args objectAtIndex:2] integerValue]
                                                       height:[[args objectAtIndex:3] integerValue]
                                                        width:[[args objectAtIndex:4] integerValue]
                                                    alignment:[[args objectAtIndex:5] integerValue]
                                                  textPostion:[[args objectAtIndex:6] integerValue]];
                            
                            //[self callback:command.callbackId isSuccess:YES];
                        }
                    }
                    else if ([action isEqualToString:METHOD_PRINT_BITMAP])
                    {
                        //  프린터 객체 생성 여부 체크 및 필요한 파라미터 갯수 체크
                        if([args count] <= 3)
                        {
                            [self callback:command.callbackId isSuccess:NO];
                        }
                        
                        else
                        {
                            result = [posPrinter printBitmap:[[args objectAtIndex:0] integerValue]  fileName:[args objectAtIndex:1] width:[[args objectAtIndex:2] integerValue]  alignment:[[args objectAtIndex:3] integerValue]];
                            
                            //[self callback:command.callbackId isSuccess:YES];
                        }
                    }
                    else if ([action isEqualToString:METHOD_PRINT_BITMAP_WITH_BASE64])
                    {
                        //  프린터 객체 생성 여부 체크 및 필요한 파라미터 갯수 체크
                        if([args count] <= 3)
                        {
                            [self callback:command.callbackId isSuccess:NO];
                        }
                        
                        else
                        {
                            NSString* strImgData = [NSString stringWithFormat:@"%@", [args objectAtIndex:1]];
                            UIImage* image = [self decodeBase64ToImage:strImgData];
                            
                            result = [posPrinter printBitmap:[[args objectAtIndex:0] integerValue] image:[UIImage imageWithCGImage:image.CGImage] width:[[args objectAtIndex:2] integerValue]  alignment:[[args objectAtIndex:3] integerValue] ];//brightness:10050 imageCorrection:5];
                        }
                    }
                    else if ([action isEqualToString:METHOD_PRINT_IMMEDIATE])
                    {
                        //  프린터 객체 생성 여부 체크 및 필요한 파라미터 갯수 체크
                        if([args count] <= 2)
                        {
                            [self callback:command.callbackId isSuccess:NO];
                        }
                        
                        else
                        {
                            result = [posPrinter printImmediate:[[args objectAtIndex:0] integerValue]  data:[args objectAtIndex:1]];
                            //[self callback:command.callbackId isSuccess:YES];
                        }
                        
                    }
                    else if ([action isEqualToString:METHOD_PRINT_NORMAL])
                    {
                        //  프린터 객체 생성 여부 체크 및 필요한 파라미터 갯수 체크
                        if([args count] <= 1)
                        {
                            [self callback:command.callbackId isSuccess:NO];
                        }
                        
                        else
                        {
                            result = [posPrinter printNormal:[[args objectAtIndex:0]  integerValue] data: [args objectAtIndex:1]];
                            //[self callback:command.callbackId isSuccess:YES];
                            
                        }
                    }
                    else if ([action isEqualToString:METHOD_TRANSACTION_PRINT])
                    {
                        //  프린터 객체 생성 여부 체크 및 필요한 파라미터 갯수 체크
                        if([args count] <= 1)
                        {
                            [self callback:command.callbackId isSuccess:NO];
                        }
                        
                        else
                        {
                            result = [posPrinter transactionPrint:[[args objectAtIndex:0]  integerValue] control:[[args objectAtIndex:1] integerValue] ];
                            //[self callback:command.callbackId isSuccess:YES];
                        }
                    }
                    else if ([action isEqualToString:METHOD_GET_PRINTER_STATUS])
                    {
                        if(posPrinter.DeviceEnabled){
                            if(currentStatus & 1){
                                [self callback:command.callbackId isSuccess:YES WithMessageInt:1];
                            }
                            else if (currentStatus & 2){
                                [self callback:command.callbackId isSuccess:YES WithMessageInt:2];
                            }
                            else if (currentStatus & 4){
                                [self callback:command.callbackId isSuccess:YES WithMessageInt:4];
                            }
                            else if (currentStatus & 32){
                                [self callback:command.callbackId isSuccess:YES WithMessageInt:8];
                            }
                            else
                                [self callback:command.callbackId isSuccess:YES WithMessageInt:currentStatus];
                        }
                        else{
                            [self callback:command.callbackId isSuccess:NO];
                        }
                    }
                    else if([action isEqualToString:METHOD_DIRECT_IO])
                    {
                        NSArray* array = [args objectAtIndex:0];
                        NSMutableData* writeBytes = [NSMutableData data];
                        //                        for( NSNumber* p in array){
                        for( int i=0; i<array.count; i++){
                            NSNumber* number = [array objectAtIndex:i];
                            unsigned char byte = number.integerValue;
                            [writeBytes appendBytes:&byte length:1];
                        }
                        
                        result = [posPrinter directIO:0 data:(void*)writeBytes object:nil];
                    }
                    else
                    {
                        [self callback:command.callbackId isSuccess:NO];
                        return false;
                    }
                }
                
                
                
            }
        }
        
        
        if(result!=-1)
        {
            switch (result) {
                case UPOS_SUCCESS:
                    [self callback:command.callbackId isSuccess:YES];
                    break;
                    
                case UPOS_E_CLOSED:
                    [self callback:command.callbackId isSuccess:NO WithMessageString:@"OPOS_E_CLOSED"];
                    break;
                    
                case UPOS_E_CLAIMED:
                    [self callback:command.callbackId isSuccess:NO WithMessageString:@"OPOS_E_CLAIMED"];
                    break;
                    
                case UPOS_E_NOTCLAIMED:
                    [self callback:command.callbackId isSuccess:NO WithMessageString:@"OPOS_E_NOTCLAIMED"];
                    break;
                    
                case UPOS_E_NOSERVICE:
                    [self callback:command.callbackId isSuccess:NO WithMessageString:@"OPOS_E_NOSERVICE"];
                    break;
                    
                case UPOS_E_DISABLED:
                    [self callback:command.callbackId isSuccess:NO WithMessageString:@"OPOS_E_DISABLED"];
                    break;
                    
                case UPOS_E_ILLEGAL:
                    [self callback:command.callbackId isSuccess:NO WithMessageString:@"OPOS_E_ILLEGAL"];
                    break;
                    
                case UPOS_E_NOHARDWARE:
                    [self callback:command.callbackId isSuccess:NO WithMessageString:@"OPOS_E_NOHARDWARE"];
                    break;
                    
                case UPOS_E_OFFLINE:
                    [self callback:command.callbackId isSuccess:NO WithMessageString:@"OPOS_E_OFFLINE"];
                    break;
                    
                case UPOS_E_NOEXIST:
                    [self callback:command.callbackId isSuccess:NO WithMessageString:@"OPOS_E_NOEXIST"];
                    break;
                    
                case UPOS_E_EXISTS:
                    [self callback:command.callbackId isSuccess:NO WithMessageString:@"OPOS_E_EXISTS"];
                    break;
                    
                case UPOS_E_FAILURE:
                    [self callback:command.callbackId isSuccess:NO WithMessageString:@"OPOS_E_FAILURE"];
                    break;
                    
                case UPOS_E_TIMEOUT:
                    [self callback:command.callbackId isSuccess:NO WithMessageString:@"OPOS_E_TIMEOUT"];
                    break;
                    
                case UPOS_E_BUSY:
                    [self callback:command.callbackId isSuccess:NO WithMessageString:@"OPOS_E_BUSY"];
                    break;
                    
                case UPOS_E_EXTENDED:
                    [self callback:command.callbackId isSuccess:NO WithMessageString:@"OPOS_E_EXTENDED"];
                    break;
                    
                case UPOS_E_DEPRECATED:
                    [self callback:command.callbackId isSuccess:NO WithMessageString:@"OPOS_E_DEPRECATED"];
                    break;
                    
                case UPOSERR:
                    [self callback:command.callbackId isSuccess:NO WithMessageString:@"OPOSERR"];
                    break;
                    
                case UPOSERREXT:
                    [self callback:command.callbackId isSuccess:NO WithMessageString:@"OPOSERREXT"];
                    break;
                    
                default:
                    [self callback:command.callbackId isSuccess:NO WithMessageString:@"KNOWN ERROR"];
                    break;
                    
            }
            
        }
        
        return true;
    }
    @catch (NSException* e) {
        NSLog(@"error : %@", e.name);
    }
    
    //    }
    //                    @catch (NSException* e) {
    ////        e.printStackTrace();
    ////        callbackContext.error(e.getMessage());
    //        return false;
    ////    } catch (JSONException e) {
    ////        e.printStackTrace();
    ////        callbackContext.error(e.getMessage());
    ////        return false;
    ////    }
    //
    ////                        @finally {
    ////
    //                        }
    
    
    return TRUE;
}

//
//
////-(void) execPrinter:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options
////{
////
////    /*NSString *callbackId = [arguments objectAtIndex:0];
////     PluginResult *pluginResult = nil;
////     NSString *javaScript = nil;*/
////    NSLog(@"execPrinter\r\n");
////
////    self.callback_internal_Id = [arguments objectAtIndex:0];
////    self.pluginResult = nil;
////    self.javaScript = nil;
////
////    NSString* command = [arguments objectAtIndex:1];
////    NSString* sendString = @"";
////
////    /*ARYA b*/
////    NSString* sendImageString = @"";
////    NSInteger alignType = 0;
////    NSInteger textSize_Width = 0;
////    NSInteger textSize_Height = 0;
////    /*ARYA e*/
////
////    //NSLog(@"arguments : %d",[arguments count]);
////    if([arguments count]>2){
////        sendString = [arguments objectAtIndex:2];
////    }
////
////    /*ARYA b*/
////    if([command isEqualToString:@"printImage"]){
////        sendImageString = [arguments objectAtIndex:2];
////    }
////    if([command isEqualToString:@"alignment"]){
////        alignType = [[arguments objectAtIndex:2] intValue];
////    }
////    if([command isEqualToString:@"textSize"]){
////        textSize_Width = [[arguments objectAtIndex:2] intValue];
////        textSize_Height = [[arguments objectAtIndex:3] intValue];
////    }
////    /*ARYA e*/
////
////
////
////}
//////@Override
//////public boolean execute(final String action, final JSONArray args, final CallbackContext callbackContext) throws JSONException {
//////    if (DEBUG) {
//////        Log.d(TAG, "execute(" + action + ", " + args + ", " + callbackContext + ")");
//////    }
//

@end
