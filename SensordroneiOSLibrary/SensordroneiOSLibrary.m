//
//  SensordroneiOSLibrary.m
//  SensordroneiOSLibrary
//
//  Created by Mark Rudolph on 5/13/13.
//  Copyright (c) 2013 Sensorcon, Inc. All rights reserved.
//

#import "SensordroneiOSLibrary.h"


@implementation Drone

@synthesize delegate;
@synthesize scannedDroneNames;
@synthesize scannedDronePeriperals;

@synthesize btleManger;
@synthesize dronePeripheral;
@synthesize droneCBUUID;
@synthesize txCharacteristic;
@synthesize txCharacteristicUUID;
@synthesize txCreditCharacteristic;
@synthesize txCreditCharacteristicUUID;
@synthesize rxCharacteristic;
@synthesize rxCharacteristicUUID;
@synthesize rxCreditCharacteristic;
@synthesize rxCreditCharacteristicUUID;

@synthesize jobQueue;

@synthesize irVobj;

@synthesize precisionGasCalibratedBasline;
@synthesize precisionGasCalibrateSensitivity;

@synthesize TYPE_GENERAL;

@synthesize TYPE_ADC_DISABLE;
@synthesize TYPE_ADC_ENABLE;
@synthesize TYPE_ADC_MEASURE;
@synthesize TYPE_ADC_STATUS;

@synthesize TYPE_ALTITUDE_DISABLE;
@synthesize TYPE_ALTITUDE_ENABLE;
@synthesize TYPE_ALTITUDE_MEASURE;
@synthesize TYPE_ALTITUDE_STATUS;

@synthesize TYPE_CAPACITANCE_DISABLE;
@synthesize TYPE_CAPACITANCE_ENABLE;
@synthesize TYPE_CAPACITANCE_MEASURE;
@synthesize TYPE_CAPACITANCE_STATUS;

@synthesize TYPE_HUMIDITY_DISABLE;
@synthesize TYPE_HUMIDITY_ENABLE;
@synthesize TYPE_HUMIDITY_MEASURE;
@synthesize TYPE_HUMIDITY_STATUS;

@synthesize TYPE_I2C_READ;
@synthesize TYPE_I2C_WRITE;

@synthesize TYPE_IR_TEMPERATURE_DISABLE;
@synthesize TYPE_IR_TEMPERATURE_ENABLE;
@synthesize TYPE_IR_TEMPERATURE_MEASURE;
@synthesize TYPE_IR_TEMPERATURE_MEASURE_B;
@synthesize TYPE_IR_TEMPERATURE_STATUS;

@synthesize TYPE_LED;

@synthesize TYPE_OXIDIZING_GAS_DISABLE;
@synthesize TYPE_OXIDIZING_GAS_ENABLE;
@synthesize TYPE_OXIDIZING_GAS_MEASURE;
@synthesize TYPE_OXIDIZING_GAS_STATUS;

@synthesize TYPE_POWER_BATTERY_VOLTAGE;

@synthesize TYPE_POWER_CHARGING_STATUS;

@synthesize TYPE_PRECISION_GAS_DISABLE;
@synthesize TYPE_PRECISION_GAS_ENABLE;
@synthesize TYPE_PRECISION_GAS_MEASURE;
@synthesize TYPE_PRECISION_GAS_STATUS;
@synthesize TYPE_PRECISION_READ_CALIBRATION;

@synthesize TYPE_PRESSURE_DISABLE;
@synthesize TYPE_PRESSURE_ENABLE;
@synthesize TYPE_PRESSURE_MEASURE;
@synthesize TYPE_PRESSURE_STATUS;

@synthesize TYPE_REDUCING_GAS_DISABLE;
@synthesize TYPE_REDUCING_GAS_ENABLE;
@synthesize TYPE_REDUCING_GAS_MEASURE;
@synthesize TYPE_REDUCING_GAS_STATUS;

@synthesize TYPE_RGBC_DISABLE;
@synthesize TYPE_RGBC_ENABLE;
@synthesize TYPE_RGBC_MEASURE;
@synthesize TYPE_RGBC_STATUS;

@synthesize TYPE_TEMPERATURE_DISABLE;
@synthesize TYPE_TEMPERATURE_ENABLE;
@synthesize TYPE_TEMPERATURE_MEASURE;
@synthesize TYPE_TEMPERATURE_STATUS;

@synthesize TYPE_UART_READ;
@synthesize TYPE_UART_WRITE;

@synthesize TYPE_USB_UART_READ;
@synthesize TYPE_USB_UART_WRITE;

@synthesize TYPE_DISCONNECT;


// Handle some initializations
-(id) init {
    self = [super init];
    if (self) {
        scannedDronePeriperals = [[NSMutableArray alloc] init];
        scannedDroneNames = [[NSMutableArray alloc] init];
  
        
        TYPE_GENERAL = @"General";
        TYPE_DISCONNECT = @"Disconnect";
        
        TYPE_TEMPERATURE_MEASURE = @"Temperature Measure";
        TYPE_TEMPERATURE_ENABLE = @"Temperature Enable";
        TYPE_TEMPERATURE_DISABLE = @"Temperature Disable";
        TYPE_TEMPERATURE_STATUS = @"Temperature Status";
        
        TYPE_HUMIDITY_MEASURE = @"Humidity Measure";
        TYPE_HUMIDITY_ENABLE = @"Humidity Enable";
        TYPE_HUMIDITY_DISABLE = @"Humidity Disable";
        TYPE_HUMIDITY_STATUS = @"Humidity Status";
        
        TYPE_PRESSURE_MEASURE = @"Pressure Measure";
        TYPE_PRESSURE_ENABLE = @"Pressure Enable";
        TYPE_PRESSURE_DISABLE = @"Pressure Disable";
        TYPE_PRESSURE_STATUS = @"Pressure Status";
        
        TYPE_ALTITUDE_MEASURE = @"Altitude Measure";
        TYPE_ALTITUDE_ENABLE = @"Altitude Enable";
        TYPE_ALTITUDE_DISABLE = @"Altitude Disable";
        TYPE_ALTITUDE_STATUS = @"Altitude Status";
        
        TYPE_RGBC_MEASURE = @"RGBC Measure";
        TYPE_RGBC_ENABLE = @"RGBC Enable";
        TYPE_RGBC_DISABLE = @"RGBC Disable";
        TYPE_RGBC_STATUS = @"RGBC Status";
        
        TYPE_OXIDIZING_GAS_MEASURE = @"Oxidizing Measure";
        TYPE_OXIDIZING_GAS_ENABLE = @"Oxidizing Enable";
        TYPE_OXIDIZING_GAS_DISABLE = @"Oxidizing Disable";
        TYPE_OXIDIZING_GAS_STATUS = @"Oxidizing Status";
        
        TYPE_REDUCING_GAS_MEASURE = @"Reducing Measure";
        TYPE_REDUCING_GAS_ENABLE = @"Reducing Enable";
        TYPE_REDUCING_GAS_DISABLE = @"Reducing Disable";
        TYPE_REDUCING_GAS_STATUS = @"Reducing Status";
        
        TYPE_LED = @"LED";
        
        TYPE_POWER_BATTERY_VOLTAGE = @"Power Battery Voltage";
        TYPE_POWER_CHARGING_STATUS = @"Power Charging Status";
        
        TYPE_PRECISION_GAS_MEASURE = @"Precision Measure";
        TYPE_PRECISION_GAS_ENABLE = @"Precision Enable";
        TYPE_PRECISION_GAS_DISABLE = @"Precision Disable";
        TYPE_PRECISION_GAS_STATUS = @"Precision Status";
        TYPE_PRECISION_READ_CALIBRATION = @"Precision Read Calibration";
        
        TYPE_IR_TEMPERATURE_MEASURE = @"IR Measure";
        TYPE_IR_TEMPERATURE_MEASURE_B = @"IR Measure B";
        TYPE_IR_TEMPERATURE_ENABLE = @"IR Enable";
        TYPE_IR_TEMPERATURE_DISABLE = @"IR Disable";
        TYPE_IR_TEMPERATURE_STATUS = @"IR Status";
        
        TYPE_ADC_MEASURE = @"ADC Measure";
        TYPE_ADC_ENABLE = @"ADC Enable";
        TYPE_ADC_DISABLE = @"ADC Disable";
        TYPE_ADC_STATUS = @"ADC Status";
        
        TYPE_CAPACITANCE_MEASURE = @"Capacitance Measure";
        TYPE_CAPACITANCE_ENABLE = @"Capacitance Enable";
        TYPE_CAPACITANCE_DISABLE = @"Capacitance Disable";
        TYPE_CAPACITANCE_STATUS = @"Capacitance Status";
        
        TYPE_UART_READ =  @"UART Read";
        TYPE_UART_WRITE = @"UART Write";
        TYPE_I2C_READ = @"I2C Read";
        TYPE_I2C_WRITE = @"I2C Write";
        
        TYPE_UART_READ = @"USB UART Read";
        TYPE_USB_UART_WRITE = @"USB UART Write";
        
        // Set up our CBManager
        
        jobQueue = [[NSOperationQueue alloc] init];
        [jobQueue setMaxConcurrentOperationCount:1];
        
        btleManger = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
        // Set UUIDs
        txCharacteristicUUID = [CBUUID UUIDWithString:@"8b00ace7-eb0b-49b0-bbe9-9aee0a26e1a3"];
//        txCharacteristic = [CBCharacteristic alloc]
        txCreditCharacteristicUUID = [CBUUID UUIDWithString:@"e06d5efb-4f4a-45c0-9eb1-371ae5a14ad4"];
        rxCharacteristicUUID = [CBUUID UUIDWithString:@"0734594a-a8e7-4b1a-a6b1-cd5243059a57"];
        rxCreditCharacteristicUUID = [CBUUID UUIDWithString:@"ba04c4b2-892b-43be-b69c-5d13f2195392"];
        
        
        
        ledColors = [[NSMutableDictionary alloc]initWithCapacity:6];
        [ledColors setValue:[NSNumber numberWithUnsignedChar:0x00] forKey:@"Left Red"];
        [ledColors setValue:[NSNumber numberWithUnsignedChar:0x00] forKey:@"Right Red"];
        [ledColors setValue:[NSNumber numberWithUnsignedChar:0x00] forKey:@"Left Green"];
        [ledColors setValue:[NSNumber numberWithUnsignedChar:0x00] forKey:@"Right Green"];
        [ledColors setValue:[NSNumber numberWithUnsignedChar:0x00] forKey:@"Left Blue"];
        [ledColors setValue:[NSNumber numberWithUnsignedChar:0x00] forKey:@"Right Blue"];
        
    }
    return self;
    
}

-(id) initWithDelegate:(id<DroneEventDelegate>)droneEventDelegate {
    self = [self init];
    if (self) {
        // Set up our CBManager
        delegate = droneEventDelegate;
    }
    return self;
}




//
// Drone stuff



-(void) sendLECommand:(unsigned char[]) command :(int) arrayLength :(NSString*)sensorType{

    // fill in NSOperation Stuff here
    leCommand *comOp = [[leCommand alloc] init];
    NSData *leCommand = [NSData dataWithBytes:command length:arrayLength];
    [comOp setCommand:leCommand];
    [comOp setMyDrone:self];
    [comOp setSensorType:sensorType];
    [jobQueue addOperation:comOp];

}


-(void) scanForDrones {
    // Clear our arrays with previously found devices
    [self.scannedDroneNames removeAllObjects];
    [self.scannedDronePeriperals removeAllObjects];
    // Search for ANY btle device
    [btleManger scanForPeripheralsWithServices:nil options:nil];
}

-(void) stopScanningForDrones {
    [btleManger stopScan];
}

-(void) btleConnect:(CBPeripheral *)aPeripheral {
    dronePeripheral = aPeripheral;
    if ([dronePeripheral state] == CBPeripheralStateDisconnected) {
        [btleManger connectPeripheral:dronePeripheral options:nil];
    }
    // isConnected was depracated in iOS7
//    if (![dronePeripheral isConnected]) {
//        [btleManger connectPeripheral:dronePeripheral options:nil];
//    }

}

-(void) disconnect {
    if ([dronePeripheral state] == CBPeripheralStateConnected) {
        unsigned char command[] = {0x05, 0x08, 0x15,
            0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
            0x00
        };
        [self sendLECommand:command :sizeof(command) :TYPE_DISCONNECT];
    }
    // isConnected was depracated in iOS7
//    if ([dronePeripheral isConnected]) {
//        unsigned char command[] = {0x05, 0x08, 0x15,
//            0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
//            0x00
//        };
//        [self sendLECommand:command :sizeof(command) :TYPE_DISCONNECT];
//    }
}

-(void) checkIfDroneIsCharging {
    unsigned char call[] = {0x05, 0x06, 0x10, 0x02, 0x48, 0x01, 0x02, 0x00};
    [self sendLECommand:call :sizeof(call) :TYPE_POWER_CHARGING_STATUS];
}

-(void) measureDroneBatteryVoltage {
    unsigned char call[] = {0x05, 0x02, 0x22, 0x00};
    [self sendLECommand:call :sizeof(call) :TYPE_POWER_BATTERY_VOLTAGE];
}


-(void) ledCommand {
    @synchronized(ledColors) {
        unsigned char command[] = {0x05, 0x08, 0x15,
            [[ledColors objectForKey:@"Left Red"] unsignedCharValue],
            [[ledColors objectForKey:@"Left Green"] unsignedCharValue],
            [[ledColors objectForKey:@"Left Blue"] unsignedCharValue],
            [[ledColors objectForKey:@"Right Red"] unsignedCharValue],
            [[ledColors objectForKey:@"Right Green"] unsignedCharValue],
            [[ledColors objectForKey:@"Right Blue"] unsignedCharValue],
            0x00
        };
        [self sendLECommand:command :sizeof(command) :TYPE_LED];
        
        }
}

-(void) setLeftLED:(int)RED :(int)GREEN :(int)BLUE {
    @synchronized(ledColors) {
    
        
        [ledColors setValue:[NSNumber numberWithUnsignedChar:(unsigned char)RED] forKey:@"Left Red"];
        [ledColors setValue:[NSNumber numberWithUnsignedChar:(unsigned char)GREEN] forKey:@"Left Green"];
        [ledColors setValue:[NSNumber numberWithUnsignedChar:(unsigned char)BLUE] forKey:@"Left Blue"];
    
        [self ledCommand];
    }

}

-(void) setRightLED:(int)RED :(int)GREEN :(int)BLUE {
    @synchronized(ledColors) {

        [ledColors setValue:[NSNumber numberWithUnsignedChar:(unsigned char)RED] forKey:@"Right Red"];
        [ledColors setValue:[NSNumber numberWithUnsignedChar:(unsigned char)GREEN] forKey:@"Right Green"];
        [ledColors setValue:[NSNumber numberWithUnsignedChar:(unsigned char)BLUE] forKey:@"Right Blue"];
    
        [self ledCommand];
    }
}

-(void) setLEDs:(int)RED :(int)GREEN :(int)BLUE {
    @synchronized(ledColors) {
        [ledColors setValue:[NSNumber numberWithUnsignedChar:(unsigned char)RED] forKey:@"Left Red"];
        [ledColors setValue:[NSNumber numberWithUnsignedChar:(unsigned char)GREEN] forKey:@"Left Green"];
        [ledColors setValue:[NSNumber numberWithUnsignedChar:(unsigned char)BLUE] forKey:@"Left Blue"];
        [ledColors setValue:[NSNumber numberWithUnsignedChar:(unsigned char)RED] forKey:@"Right Red"];
        [ledColors setValue:[NSNumber numberWithUnsignedChar:(unsigned char)GREEN] forKey:@"Right Green"];
        [ledColors setValue:[NSNumber numberWithUnsignedChar:(unsigned char)BLUE] forKey:@"Right Blue"];
        [self ledCommand];
    }
    
}

-(void)notifyDelegate:(SEL)selector {
    if ([delegate respondsToSelector:selector]) {
        [delegate performSelector:selector];
    } else {
    }
}

//
// Ambient Temperature
//
-(void) enableAmbientTemperature {
    [self setAmbientTemperatureStatus:YES];
    [self notifyDelegate:@selector(doOnAmbientTemperatureEnabled)];
}

-(void) disableAmbientTemperature {
    [self setAmbientTemperatureStatus:NO];
    [self notifyDelegate:@selector(doOnAmbientTemperatureDisabled)];
}

-(void) checkAmbientTemperatureStatus {
    [self notifyDelegate:@selector(doOnAmbientTemperatureStatusChecked)];
}

-(void) measureAmbientTemperature {
    
    if ([self ambientTemperatureStatus]) {
        unsigned char command[] = {0x05, 0x06, 0x10, 0x00, 0x40, 0xe3, 0x02, 0x00};
        [self sendLECommand:command:sizeof(command):TYPE_TEMPERATURE_MEASURE];
    }
    
}

//
// Humidity
//
-(void) enableHumidity {
    [self setHumidityStatus:YES];
    [self notifyDelegate:@selector(doOnHuditiyEnabled)];
}

-(void) disableHumidity {
    [self setHumidityStatus:NO];
    [self notifyDelegate:@selector(doOnHuditiyDisabled)];
}

-(void) checkHumidityStatus {
    [self notifyDelegate:@selector(doOnHumidityStatusChecked)];
}

-(void) measureHumidity {

    if ([self humidityStatus]) {
        unsigned char command[] = {0x05, 0x06, 0x10, 0x00, 0x40, 0xe5, 0x02, 0x00};
        [self sendLECommand:command:sizeof(command):TYPE_HUMIDITY_MEASURE];
    }
    
}

//
// Pressure
//
-(void) enablePressure {
    unsigned char enable[] =           {0x05, 0x07, 0x11, 0x00, 0x60, 0x01, 0x26, 0x3f, 0x00};
    unsigned char setMode[] =          {0x05, 0x07, 0x11, 0x00, 0x60, 0x01, 0x26, 0x38, 0x00};
    unsigned char enableDataFlags[] =  {0x05, 0x07, 0x11, 0x00, 0x60, 0x01, 0x13, 0x07, 0x00};
    unsigned char setActive[] =        {0x05, 0x07, 0x11, 0x00, 0x60, 0x01, 0x26, 0x39, 0x00};

    [self sendLECommand:enable:sizeof(enable):TYPE_GENERAL];
//    [NSThread sleepForTimeInterval:0.3];
    [self sendLECommand:setMode:sizeof(setMode):TYPE_GENERAL];
//    [NSThread sleepForTimeInterval:0.3];
    [self sendLECommand:enableDataFlags:sizeof(enableDataFlags):TYPE_GENERAL];
//    [NSThread sleepForTimeInterval:0.3];
    [self sendLECommand:setActive:sizeof(setActive):TYPE_PRESSURE_ENABLE];
    
}

-(void) disablePressure {
     unsigned char disable[] = {0x05, 0x07, 0x11, 0x00, 0x60, 0x01, 0x26, 0x3f, 0x00};
    [self sendLECommand:disable:sizeof(disable):TYPE_PRESSURE_DISABLE];
    
}

-(void) checkPressureStatus {
     unsigned char status[] = {0x05, 0x06, 0x10, 0x00, 0x60, 0x26, 0x02, 0x00};
    [self sendLECommand:status:sizeof(status):TYPE_PRESSURE_STATUS];
}

-(void) measurePressure {
    if ([self pressureStatus]) {
        unsigned char command[] = {0x05, 0x05, 0x10, 0x00, 0x60, 0x01, 0x05};
        [self sendLECommand:command:sizeof(command):TYPE_PRESSURE_MEASURE];
    }
    
}

//
// Altitude
//
-(void) enableAltitude {
    unsigned char enable[] =           {0x05, 0x07, 0x11, 0x00, 0x60, 0x01, 0x26, 0x3f, 0x00};
    unsigned char setMode[] =          {0x05, 0x07, 0x11, 0x00, 0x60, 0x01, 0x26, 0x38, 0x00};
    unsigned char enableDataFlags[] =  {0x05, 0x07, 0x11, 0x00, 0x60, 0x01, 0x13, 0x07, 0x00};
    unsigned char setActive[] =        {0x05, 0x07, 0x11, 0x00, 0x60, 0x01, 0x26, 0x39, 0x00};
    
    [self sendLECommand:enable:sizeof(enable):TYPE_GENERAL];
    [self sendLECommand:setMode:sizeof(setMode):TYPE_GENERAL];
    [self sendLECommand:enableDataFlags:sizeof(enableDataFlags):TYPE_GENERAL];
    [self sendLECommand:setActive:sizeof(setActive):TYPE_ALTITUDE_ENABLE];
}

-(void) disableAltitude {
    unsigned char disable[] = {0x05, 0x07, 0x11, 0x00, 0x60, 0x01, 0x26, 0x3f, 0x00};
    [self sendLECommand:disable:sizeof(disable):TYPE_ALTITUDE_DISABLE];
}

-(void) checkAltitudeStatus {
    unsigned char status[] = {0x05, 0x06, 0x10, 0x00, 0x60, 0x26, 0x02, 0x00};
    [self sendLECommand:status:sizeof(status):TYPE_ALTITUDE_STATUS];
}

-(void) measureAltitude {
    if ([self altitudeStatus]) {
        unsigned char command[] = {0x05, 0x05, 0x10, 0x00, 0x60, 0x01, 0x05};
        [self sendLECommand:command:sizeof(command):TYPE_ALTITUDE_MEASURE];
    }
}

//
// R G B C
//
-(void) enableRGBC {
    unsigned char transistorOn[] =    {0x05, 0x03, 0x35, 0x01, 0x00};
    unsigned char powerOn[] =         {0x05, 0x07, 0x11, 0x00, 0x39, 0x01, 0x80, 0x01, 0x00};
    unsigned char intTime_100[] =     {0x05, 0x07, 0x11, 0x00, 0x39, 0x01, 0x81, 0x01, 0x00};
    unsigned char initADC[] =         {0x05, 0x07, 0x11, 0x00, 0x39, 0x01, 0x80, 0x03, 0x00};
    
    [self sendLECommand:transistorOn:sizeof(transistorOn):TYPE_GENERAL];
    [self sendLECommand:powerOn:sizeof(powerOn):TYPE_GENERAL];
    [self sendLECommand:intTime_100:sizeof(intTime_100):TYPE_GENERAL];
    [self sendLECommand:initADC:sizeof(initADC):TYPE_RGBC_ENABLE];
}

-(void) disableRGBC {
    unsigned char transistorOff[] =    {0x05, 0x03, 0x35, 0x00, 0x00};
    unsigned char powerOff[] =         {0x05, 0x07, 0x11, 0x00, 0x39, 0x01, 0x80, 0x00, 0x00};
    
    [self sendLECommand:powerOff:sizeof(powerOff):TYPE_GENERAL];
    [self sendLECommand:transistorOff:sizeof(transistorOff):TYPE_RGBC_DISABLE];
}

-(void) checkRGBCStatus {
    unsigned char status[] = {0x05, 0x03, 0x60, 0x01, 0x00};
    [self sendLECommand:status:sizeof(status):TYPE_RGBC_STATUS];
}

-(void) measureRGBC {
    if ([self rgbcStatus]) {
        unsigned char command[] = {0x05, 0x06, 0x10, 0x00, 0x39, 0x90, 0x08, 0x00};
        [self sendLECommand:command:sizeof(command):TYPE_RGBC_MEASURE];
    }
}

//
// IR
//
-(void) enableIRTemperature {
    unsigned char command[] = {0x05, 0x07, 0x11, 0x00, 0x41, 0x01, 0x02, 0x75, 0x00};
    [self sendLECommand:command:sizeof(command):TYPE_IR_TEMPERATURE_ENABLE];
    
}

-(void) disableIRTemperature {
    unsigned char command[] = {0x05, 0x07, 0x11, 0x00, 0x41, 0x01, 0x02, 0x00, 0x00};
    [self sendLECommand:command:sizeof(command):TYPE_IR_TEMPERATURE_DISABLE];
}

-(void) checkIRTemperatureStatus {
    unsigned char command[] = {0x05, 0x06, 0x10, 0x00, 0x41, 0x02, 0x01, 0x00};
    [self sendLECommand:command:sizeof(command):TYPE_IR_TEMPERATURE_STATUS];
}

-(void) measureIRTemperature {
    if ([self irTemperatureStatus]) {
        unsigned char command[] = {0x05, 0x06, 0x10, 0x00, 0x41, 0x00, 0x02, 0x00};
        [self sendLECommand:command:sizeof(command):TYPE_IR_TEMPERATURE_MEASURE];
    }
}


//
// Precision Gas
//
-(void) enablePrecisionGas {
    [self setPrecisiongGasStatus:YES];
    [self notifyDelegate:@selector(doOnPrecisonGasEnabled)];
}

-(void) disablePrecisionGas {
    [self setPrecisiongGasStatus:NO];
    [self notifyDelegate:@selector(doOnPrecisonGasDisabled)];
}

-(void) checkPrecisionGasStatus {
    [self notifyDelegate:@selector(doOnPrecisonGasStatusChecked)];
}

-(void) measurePrecisionGas {
    if ([self precisiongGasStatus]) {
        unsigned char command[] =  {0x05, 0x02, 0x20, 0x00};
        [self sendLECommand:command:sizeof(command):TYPE_PRECISION_GAS_MEASURE];
    }
}

//
// Oxidizing
//

-(void) enableOxidizingGas {
    unsigned char command[] = {0x05, 0x03, 0x18, 0x84, 0x00};
    [self sendLECommand:command:sizeof(command):TYPE_OXIDIZING_GAS_ENABLE];
}

-(void) disableOxidizingGas {
    unsigned char command[] = {0x05, 0x03, 0x18, 0x00, 0x00};
    [self sendLECommand:command:sizeof(command):TYPE_OXIDIZING_GAS_DISABLE];
}

-(void) checkOxidizingGasStatus {
    unsigned char command[] = {0x05, 0x02, 0x1b, 0x00};
    [self sendLECommand:command:sizeof(command):TYPE_OXIDIZING_GAS_STATUS];
}

-(void) measureOxidizingGas {
    if ([self oxidizingGasStatus]) {
        unsigned char command[] = {0x05, 0x02, 0x1c, 0x00};
        [self sendLECommand:command:sizeof(command):TYPE_OXIDIZING_GAS_MEASURE];
    }
}

//
// Reducing
//
-(void) enableReducingGas {
    unsigned char command[] = {0x05, 0x03, 0x19, 0xba, 0x00};
    [self sendLECommand:command:sizeof(command):TYPE_REDUCING_GAS_ENABLE];
}

-(void) disableReducingGas {
    unsigned char command[] = {0x05, 0x03, 0x19, 0x00, 0x00};
    [self sendLECommand:command:sizeof(command):TYPE_REDUCING_GAS_DISABLE];
}

-(void) checkReducingGasStatus {
    unsigned char command[] = {0x05, 0x02, 0x1a, 0x00};
    [self sendLECommand:command:sizeof(command):TYPE_REDUCING_GAS_STATUS];
}

-(void) measureReducingGas {
    if ([self reducingGasStatus]) {
        unsigned char command[] = {0x05, 0x02, 0x1c, 0x00};
        [self sendLECommand:command:sizeof(command):TYPE_REDUCING_GAS_MEASURE];
    }
}

//
// ADC
//

-(void) enableADC {
    [self setAdcStatus:YES];
    [self notifyDelegate:@selector(doOnADCEnabled)];
}

-(void) disableADC {
    [self setAdcStatus:NO];
    [self notifyDelegate:@selector(doOnADCDisabled)];
}

-(void) checkADCStatus {
    [self notifyDelegate:@selector(doOnADCStatusChecked)];
}

-(void) measureADC {
    
    if ([self adcStatus]) {
        unsigned char readExtADC[] = {0x05 , 0x02, 0x21, 0x00};
        [self sendLECommand:readExtADC:sizeof(readExtADC):TYPE_ADC_MEASURE];
    }
    
}

//
// Capacitance
//

-(void) enableCapacitance {
    unsigned char enable[] = {0x05, 0x07, 0x11, 0x01, 0x48, 0x01, 0x0f, 0x11, 0x00};
    unsigned char offset[] = {0x05, 0x08, 0x11, 0x01, 0x48, 0x01, 0x05, 0x30, 0x00, 0x00};
    unsigned char range[] = {0x05, 0x07, 0x11, 0x01, 0x48, 0x01, 0x0b, 0xc0, 0x00};
    
    [self sendLECommand:offset:sizeof(offset):TYPE_GENERAL];
    [self sendLECommand:range:sizeof(range):TYPE_GENERAL];
    [self sendLECommand:enable:sizeof(enable):TYPE_CAPACITANCE_ENABLE];
}

-(void) disableCapacitance {
    unsigned char disable[] = {0x05, 0x07, 0x11, 0x01, 0x48, 0x01, 0x0f, 0x00, 0x00};
    [self sendLECommand:disable:sizeof(disable):TYPE_CAPACITANCE_DISABLE];

}

-(void) checkCapacitanceStatus {
    unsigned char command[] = {0x05, 0x06, 0x10, 0x01, 0x48, 0x00, 0x10, 0x00};
    [self sendLECommand:command:sizeof(command):TYPE_CAPACITANCE_STATUS];
}

-(void) measureCapacitance {
    if ([self capacitanceStatus]) {
        unsigned char command[] = {0x05, 0x06, 0x10, 0x01, 0x48, 0x00, 0x03, 0x00};
        [self sendLECommand:command:sizeof(command):TYPE_CAPACITANCE_MEASURE];
    }
}

//
// UART
//

-(void) readFromUART {
    unsigned char command[] = {0x05, 0x02, 0x25, 0x00};
    [self sendLECommand:command :sizeof(command) :TYPE_UART_READ];
}

-(void) writeToUART:(char *[])data {

}

//
// I2C
//

-(void) i2cRead {
    
}

-(void) i2cWrite:(char *[])data {
    
}

//
// Handle our Core Bluetooth Stuff Here
//

// On connect
-(void) centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral {

    // Set ourself to connected
    [self setIsDroneConnected:YES];
    // Make sure we handle our LE Events
    [dronePeripheral setDelegate:self];
    
    // Scan for available Services
    [dronePeripheral discoverServices:nil];

    // Restart our Job Queue if necessary
    if ([self.jobQueue isSuspended]) {
        [self.jobQueue setSuspended:NO];
    }
    
}

// on Disconnect
-(void) centralManager:(CBCentralManager *)central didDisconnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error {
    
    if (error)
    {
        NSLog(@"didDisconnectPeripheral error: %@", [error localizedDescription]);
    }
    
    // We should set isDroneConencted in the disconnect method, and check here to detect disconnects.
    
    // If I think I still connected
    if ([self isDroneConnected]) {
        // Then it was probably a connection lost
        [self setIsDroneConnected:NO];
        [self notifyDelegate:@selector(doOnConnectionLost)];
    } else {
        [self notifyDelegate:@selector(doOnDisconnect)];
    }
    
    // Clear out the Job Queue
    if (![jobQueue isSuspended]) {
        [jobQueue setSuspended:YES];
        
    }
    // Try and free up any locked threads
    NSArray *currentOps = [jobQueue operations];
    if ([currentOps count] > 0) {
        // Get our running operation
        leCommand *myOp = [currentOps objectAtIndex:0];
        // Handle the locks and provide the data
        [myOp.commLock lock];
        [myOp setResponse:nil];
        [myOp setHasResponse:YES];
        [myOp.commLock signal];
        [myOp.commLock unlock];
        
    }
    [jobQueue cancelAllOperations];
    
}



// On Discover
-(void) centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI {    
    
    // Get the device name
    NSString *localName = [advertisementData objectForKey:CBAdvertisementDataLocalNameKey];
    
    // We only want Sensordrones
    if (localName != nil && [localName rangeOfString:@"Sensordrone"].location != NSNotFound) {
        
        // Add the name and peripheral to our list
        [scannedDroneNames addObject:localName];
        [scannedDronePeriperals addObject:peripheral];
        // Fire away
        [self notifyDelegate:@selector(doOnFoundDrone)];
    }
    
    
}

// On Connection failed
-(void) centralManager:(CBCentralManager *)central didFailToConnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error {
    if (error)
    {
        NSLog(@"didFailToConnectPeripheral error: %@", [error localizedDescription]);
    }
    [self notifyDelegate:@selector(doOnConnectionFailed)];

}

// We don't use this method
-(void) centralManager:(CBCentralManager *)central didRetrieveConnectedPeripherals:(NSArray *)peripherals {
    
}

// We don't use this method
-(void) centralManager:(CBCentralManager *)central didRetrievePeripherals:(NSArray *)peripherals {

//    int knownDevices = [peripherals count];
//    for (int i=0; i < knownDevices; i++) {
//        NSLog(@"Adding known peripheral: %@", [[peripherals objectAtIndex:i] name]);
//        [scannedDroneNames addObject:[[peripherals objectAtIndex:i] name]];
//        [scannedDronePeriperals addObject:[peripherals objectAtIndex:i]];
//        [self notifyDelegate:@selector(doOnFoundDrone)];
//
//    }

    
}

// We don't use this method
-(void) centralManagerDidUpdateState:(CBCentralManager *)central {
    
}

// Set up chaacteristics Characteristics
-(void) peripheral:(CBPeripheral *)peripheral didDiscoverCharacteristicsForService:(CBService *)service error:(NSError *)error {
    
    if (error)
    {
        NSLog(@"didDiscoverCharacteristicsForService with error: %@", [error localizedDescription]);
        return;
    }
    
    
    // Cycle through the characteristics
    for (CBCharacteristic * characteristic in service.characteristics)
    {
        
        // TX
        if ([characteristic.UUID isEqual:txCharacteristicUUID]) {
            txCharacteristic = characteristic;
//            [dronePeripheral setNotifyValue:YES forCharacteristic:characteristic];
            
            unsigned char calibrationData[] = {0x05, 0x02, 0x40, 0x00};
            [self sendLECommand:calibrationData:sizeof(calibrationData):TYPE_PRECISION_READ_CALIBRATION];
            [self notifyDelegate:@selector(doOnConnect)];
        
            //RX
        } else if ([characteristic.UUID isEqual:rxCharacteristicUUID]) {
            rxCharacteristic = characteristic;
            [dronePeripheral setNotifyValue:YES forCharacteristic:characteristic];
            
            // We dont really use these. 
            
            // TX Credits
//        } else if ([characteristic.UUID isEqual:txCreditCharacteristicUUID]) {
//            txCreditCharacteristic = characteristic;
//            [dronePeripheral setNotifyValue:YES forCharacteristic:characteristic];
//            
//            // RX Credits
//        } else if ([characteristic.UUID isEqual:rxCreditCharacteristicUUID]) {
//            rxCreditCharacteristic = characteristic;
//            [dronePeripheral setNotifyValue:YES forCharacteristic:characteristic];
        }
        
    }
    
}


// We don't use this
-(void) peripheral:(CBPeripheral *)peripheral didDiscoverDescriptorsForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error {
    
}

// We don't use this
-(void) peripheral:(CBPeripheral *)peripheral didDiscoverIncludedServicesForService:(CBService *)service error:(NSError *)error {
    
}

// On Discover Services
-(void) peripheral:(CBPeripheral *)peripheral didDiscoverServices:(NSError *)error {
    if (error)
    {
        NSLog(@"didDiscoverServices with error: %@", [error localizedDescription]);
        return;
    }
    
    // Get the Charactersitics for the services
    for (CBService * service in peripheral.services)
    {
        // Can tweak this later for jsut the Characteristics we want (TX, RX).
        [peripheral discoverCharacteristics:nil forService:service];
    }
}

// We dont use this
-(void) peripheral:(CBPeripheral *)peripheral didUpdateNotificationStateForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error {
    
}

-(void) peripheral:(CBPeripheral *)peripheral didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error {
    if (error) {
        NSLog(@"didUpdateValueForCharacteristic with error %@", [error localizedDescription]);
        return;
    }
    // RX
    if ([characteristic isEqual:rxCharacteristic]) {
        // Get a list of current operations
        NSArray *currentOps = [jobQueue operations];
        if ([currentOps count] > 0) {
            // Get our running operation
            leCommand *myOp = [currentOps objectAtIndex:0];
            // Handle the locks and provide the data
            [myOp.commLock lock];
            [myOp setResponse:characteristic.value];
            [myOp setHasResponse:YES];
            [myOp.commLock signal];
            [myOp.commLock unlock];

        }
        
        
    }
    
}

// We dont use this
-(void) peripheral:(CBPeripheral *)peripheral didUpdateValueForDescriptor:(CBDescriptor *)descriptor error:(NSError *)error {
    
}

// We dont use this
-(void) peripheral:(CBPeripheral *)peripheral didWriteValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error {
}


// We dont use this
-(void) peripheral:(CBPeripheral *)peripheral didWriteValueForDescriptor:(CBDescriptor *)descriptor error:(NSError *)error {
    
    
}


-(void)clearJobQueue {
    // Clear out the Job Queue
    if (![jobQueue isSuspended]) {
        [jobQueue setSuspended:YES];
        
    }
    // Try and free up any locked threads
    NSArray *currentOps = [jobQueue operations];
    if ([currentOps count] > 0) {
        // Get our running operation
        leCommand *myOp = [currentOps objectAtIndex:0];
        // Handle the locks and provide the data
        [myOp.commLock lock];
        [myOp setResponse:nil];
        [myOp setHasResponse:YES];
        [myOp.commLock signal];
        [myOp.commLock unlock];
        
    }
    [jobQueue cancelAllOperations];
}


@end

@implementation leCommand

@synthesize commLock;
@synthesize sensorType;
@synthesize response;
@synthesize command;
@synthesize hasResponse;
@synthesize myDrone;

-(void) main {
    [commLock lock];

    [self setResponse:nil];
    [self setHasResponse:NO];
    
    // Send command if device(!) is connected (not our logical isDroneConnected)
    if ([myDrone.dronePeripheral state] == CBPeripheralStateConnected) {
        [[myDrone dronePeripheral] writeValue:command forCharacteristic:[myDrone txCharacteristic] type:CBCharacteristicWriteWithoutResponse];
    } else {
        // Give up if not connected
        return;
    }
//    isConnected was depracated in iOS7
//    if ([myDrone.dronePeripheral isConnected]) {
//        [[myDrone dronePeripheral] writeValue:command forCharacteristic:[myDrone txCharacteristic] type:CBCharacteristicWriteWithoutResponse];
//    } else {
//        // Give up if not connected
//        return;
//    }
   
    // Wait for response
    while (![self hasResponse]) {
        [commLock wait];
    }

    
    // Parse response
    if (response == nil) {
//        NSLog(@"Empty response!");
        [commLock unlock];
        return;
    } else {
//        NSLog(@"Received: %@",response);
    }
    
    // Convert our data to a char array
    unsigned char *responseData = (unsigned char*) [response bytes];
    int numberOfBytes = (responseData[1] & 0xff);
    
    // First of all, was it an error?
    
    if (responseData[3] == 0x99) {
        NSLog(@"There was an error: %@", response);
        [commLock unlock];
        return;
    }
    
    
    // DISCONNECT
    else if ([[self sensorType] isEqualToString:[myDrone TYPE_DISCONNECT]]) {
        // Pause the queue so no new jobs go in the queue
        [myDrone.jobQueue setSuspended:YES];
        [myDrone setIsDroneConnected:NO];
        [myDrone.btleManger cancelPeripheralConnection:[myDrone dronePeripheral]];
    }
    
    // TEMPERATURE
    // Dont currently need to enable/disable tempeature.
    else if ([[self sensorType] isEqualToString:[myDrone TYPE_TEMPERATURE_MEASURE]] && numberOfBytes > 2) {
        // parse data
        int MSB = (int)responseData[3] & 0xff;
        int LSB = (int)responseData[4] & 0xfc;
        int ADC = (MSB << 8) + LSB;
        float temperature = (float)(-46.85 + 175.72 * (ADC / pow(2, 16)));
        // Set properties
        [myDrone setMeasuredAmbientTemperatureInCelcius:temperature];
        [myDrone setMeasuredAmbientTemperatureInFahreneit: (temperature * (9.0 / 5.0) + 32.0)];
        [myDrone setMeasuredAmbientTemperatureInKelvin:(temperature + 273.15)];
        dispatch_sync(dispatch_get_main_queue(), ^{
            [myDrone notifyDelegate:@selector(doOnAmbientTemperatureMeasured)];
        });
        
    }
    
    // HUMIDITY
    // Dont currently need to enable/disable humidity.
    else if ([[self sensorType] isEqualToString:[myDrone TYPE_HUMIDITY_MEASURE]] && numberOfBytes > 2) {
        // parse data
        int MSB = (int)responseData[3] & 0xff;
        int LSB = (int)responseData[4] & 0xfc;
        int ADC = (MSB << 8) + LSB;
        float humidity = (float)(-6.0 + 125.0 * (ADC / pow(2, 16)));
        [myDrone setMeasuredPercentHumidity:humidity];
        dispatch_sync(dispatch_get_main_queue(), ^{
            [myDrone notifyDelegate:@selector(doOnHuditiyMeasured)];
        });
    }

    // Pressure
    else if ([[self sensorType] isEqualToString:[myDrone TYPE_PRESSURE_ENABLE]]) {
        [myDrone setPressureStatus:YES];
        dispatch_sync(dispatch_get_main_queue(), ^{
            [myDrone notifyDelegate:@selector(doOnPressureEnabled)];
        });
    }
    
    else if ([[self sensorType] isEqualToString:[myDrone TYPE_PRESSURE_DISABLE]]) {
        [myDrone setPressureStatus:NO];
        dispatch_sync(dispatch_get_main_queue(), ^{
            [myDrone notifyDelegate:@selector(doOnPressureDisabled)];
        });
    }
    else if ([[self sensorType] isEqualToString:[myDrone TYPE_PRESSURE_MEASURE]] && numberOfBytes > 4) {
        int MSB = (int)responseData[3] & 0xff;
        int LSB = (int) responseData[4] & 0xff;
        int pressureIntValue = (MSB << 8) + LSB;
        
        int pressureIntBits = ((int)responseData[5] & 0x0c) & 0xff;
        int pressureDecBits = ((int)responseData[5] & 0x03) & 0xff;
        float pascals = (float)((pressureIntValue << 2) + pressureIntBits + (pressureDecBits/4.0));
        [myDrone setMeasuredPressureInPascal:pascals];
        [myDrone setMeasuredPressureInAtmosphere:(pascals * 9.86923267e-6)];
        [myDrone setMeasuredPressureInTorr:(pascals * 0.00750061683)];
        dispatch_sync(dispatch_get_main_queue(), ^{
            [myDrone notifyDelegate:@selector(doOnPressureMeasured)];
        });
        
    }
    
    // IR
    else if ([[self sensorType] isEqualToString:[myDrone TYPE_IR_TEMPERATURE_ENABLE]]) {
        [myDrone setIrTemperatureStatus:YES];
        
        // Try and run this on the main thread
        dispatch_sync(dispatch_get_main_queue(), ^{
            [myDrone notifyDelegate:@selector(doOnIRTemperatureEnabled)];
        });
        
    }
    
    else if ([[self sensorType] isEqualToString:[myDrone TYPE_IR_TEMPERATURE_DISABLE]]) {
        [myDrone setIrTemperatureStatus:NO];
        dispatch_sync(dispatch_get_main_queue(), ^{
            [myDrone notifyDelegate:@selector(doOnIRTemperatureDisabled)];
        });
    }
    else if ([[self sensorType] isEqualToString:[myDrone TYPE_IR_TEMPERATURE_MEASURE]] && numberOfBytes > 2) {

        
        int V_OBJ = (signed char) responseData[3];
        V_OBJ *= 1 << 8;
        V_OBJ |= responseData[4];
        
        [myDrone setIrVobj:V_OBJ];
        
        unsigned char nextCommand[] = {0x05, 0x06, 0x10, 0x00, 0x41, 0x01, 0x02, 0x00};
        [myDrone sendLECommand:nextCommand:sizeof(nextCommand):[myDrone TYPE_IR_TEMPERATURE_MEASURE_B]];

        
    }
    else if ([[self sensorType] isEqualToString:[myDrone TYPE_IR_TEMPERATURE_MEASURE_B]] && numberOfBytes > 2) {
        
        // Terms used for calculating the objects Temperature
        double a1 = 1.75E-3;
        double a2 = -1.678E-5;
        double T_REF = 298.15;
        double b0 = -2.94E-5;
        double b1 = -5.7E-7;
        double b2 = 4.63E-9;
        double c2 = 13.4;
        //            double s0 = 6E-14;
        double s0 = 2.51E-14;
        
        int V_OBJ = [myDrone irVobj];
        
        int T_DIE = (signed char) responseData[3];
        T_DIE *= 1 << 8;
        T_DIE |= responseData[4];
    
        
        double dT_DIE = (double) ((T_DIE / (32.0 * 4.0)) + 273.15); // Should be Kelvin. The *4 was reversed engineered.
        double dV_OBJ = (double) (V_OBJ * 156.25e-9); // Should be in Volts

        
        double Vos = b0 + b1 * (dT_DIE - T_REF) + b2 * (dT_DIE - T_REF) * (dT_DIE - T_REF);
        double sensitivity = s0 * (1 + a1 * (dT_DIE - T_REF) + a2 * (dT_DIE - T_REF) * (dT_DIE - T_REF));
        double fVobj = (dV_OBJ - Vos) + c2 * (dV_OBJ - Vos) * (dV_OBJ - Vos);
        double TMP = dT_DIE * dT_DIE * dT_DIE * dT_DIE
        + (fVobj / sensitivity);
        double temperature = sqrt(sqrt(TMP));
        //        temperature = sqrt(temperature);

        
        [myDrone setMeasuredIRTemperatureInKelvin:temperature];
        [myDrone setMeasuredIRTemperatureInCelcius:(temperature - 273.15)];
        [myDrone setMeasuredIRTemperatureInFahreneit:((temperature - 273.15) * (9.0 / 5.0) + 32.0)];
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            [myDrone notifyDelegate:@selector(doOnIRTemperatureMeasured)];
        });
        
  
    }
    
    // LUX
    else if ([[self sensorType] isEqualToString:[myDrone TYPE_RGBC_ENABLE]]) {
        [myDrone setRgbcStatus:YES];
        dispatch_sync(dispatch_get_main_queue(), ^{
            [myDrone notifyDelegate:@selector(doOnRGBCEnabled)];
        });
    }
    else if ([[self sensorType] isEqualToString:[myDrone TYPE_RGBC_DISABLE]]) {
        [myDrone setRgbcStatus:NO];
        dispatch_sync(dispatch_get_main_queue(), ^{
            [myDrone notifyDelegate:@selector(doOnRGBCDisabled)];
        });
    }

    else if ([[self sensorType] isEqualToString:[myDrone TYPE_RGBC_MEASURE]] && numberOfBytes > 8) {
        float R = ((int)(responseData[6] & 0xff) << 8) + (int)(responseData[5] & 0xff);
        float G = ((int)(responseData[4] & 0xff) << 8) + (int)(responseData[3] & 0xff);
        float B = ((int)(responseData[8] & 0xff) << 8) + (int)(responseData[7] & 0xff);
        float C = ((int)(responseData[10] & 0xff) << 8) + (int)(responseData[9] & 0xff);
        

        
        double Rcal = 0.2639626007;
        double Gcal = 0.2935368922;
        double Bcal = 0.379682891;
        double Ccal = 0.2053011829;
        
        R += R * Rcal;
        G += G * Gcal;
        B += B * Bcal;
        C += C * Ccal;
        
        double X = -0.14282 * R + 1.54924 * G + -0.95641 * B;
        double Y = -0.32466 * R + 1.57837 * G + -0.73191 * B;
        double Z = -0.68202 * R + 0.77073 * G + 0.56332 * B;
        
        double x = X / (X + Y + Z);
        double y = Y / (X + Y + Z);
        
        double n = (x - 0.3320) / (0.1858 - y);
        
        double CCT = 449.0 * pow(n, 3) +
        3525.0 * pow(n, 2) +
        6823.3 * n +
        5520.33;
        
        [myDrone setMeasuredRGBCRedChannel:R];
        [myDrone setMeasuredRGBCGreenChannel:G];
        [myDrone setMeasuredRGBCBlueChannel:B];
        [myDrone setMeasuredRGBCClearChannel:C];
        if (Y < 0) {
            Y = 0;
        }
        [myDrone setMeasuredRGBCIlluminanceInLux:Y];
        [myDrone setMeasuredRGBCColorTemperatureInKelvin:CCT];
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            [myDrone notifyDelegate:@selector(doOnRGBCMeasured)];
        });
    
    }
    
    // Precision Gas
    else if ([[self sensorType] isEqualToString:[myDrone TYPE_PRECISION_READ_CALIBRATION]]) {
        int sensitivityLSB = (int)responseData[3] & 0xff;
        int sensitivityMSB = (int)responseData[4] & 0xff;
        int baselineLSB = (int)responseData[5] & 0xff;
        int baselineMSB = (int)responseData[6] & 0xff;
        float sensitivity = (float)(((sensitivityMSB << 8) + sensitivityLSB)/1000.0);
        [myDrone setPrecisionGasCalibrateSensitivity:sensitivity];
        float baseline = (float)((baselineMSB << 8) + baselineLSB);
        [myDrone setPrecisionGasCalibratedBasline:baseline];
        
        
    }

    else if ([[self sensorType] isEqualToString:[myDrone TYPE_PRECISION_GAS_MEASURE]] && numberOfBytes > 3) {
        int MSB = (int)responseData[4] & 0xff;
        int LSB = (int)responseData[3] & 0xff;
        int gaintStage = (int)responseData[5] & 0xff;
        
        int gainRes[] = {
            2200000,
            301961,
            113793,
            34452,
            13911,
            6978,
            3494,
            2747
        };
        
        int ADC = (MSB <<8) + LSB;
        float deltaADC = (float)ADC - [myDrone precisionGasCalibratedBasline];
        float gasResponse = (float)((deltaADC * 3.0e9) / 4096.0);
        if (deltaADC < 0.0) {
            gasResponse = 0.0;
        }
        float gain = gainRes[gaintStage];
        float ppmCO = (float)(gasResponse / ([myDrone precisionGasCalibrateSensitivity] * gain));
        
        [myDrone setMeasuredPrecisionGasInPPMCO:ppmCO];
        dispatch_sync(dispatch_get_main_queue(), ^{
            [myDrone notifyDelegate:@selector(doOnPrecisonGasMeasured)];
        });
        
    }
    
    // Cap
    
    else if ([[self sensorType] isEqualToString:[myDrone TYPE_CAPACITANCE_ENABLE]]) {
        [myDrone setCapacitanceStatus:YES];
        dispatch_sync(dispatch_get_main_queue(), ^{
            [myDrone notifyDelegate:@selector(doOnCapacitanceEnabled)];
        });
    }
    else if ([[self sensorType] isEqualToString:[myDrone TYPE_CAPACITANCE_DISABLE]]) {
        [myDrone setCapacitanceStatus:NO];
        dispatch_sync(dispatch_get_main_queue(), ^{
            [myDrone notifyDelegate:@selector(doOnCapacitanceDisabled)];
        });
    }
    else if ([[self sensorType] isEqualToString:[myDrone TYPE_CAPACITANCE_MEASURE]] && numberOfBytes > 2) {
        int MSB = (int)responseData[4] & 0xff;
        int LSB = (int)responseData[5] & 0xff;
        int ADC = (MSB << 8) + LSB;
        float capacitance = (float) (((float) ADC / 65520.0) * 4000);
        [myDrone setMeasuredCapacitanceInFemtoFarad:capacitance];
        dispatch_sync(dispatch_get_main_queue(), ^{
            [myDrone notifyDelegate:@selector(doOnCapacitanceMeasured)];
        });
    }
    
    // ADC
    else if ([[self sensorType] isEqualToString:[myDrone TYPE_ADC_MEASURE]] && numberOfBytes > 2) {
        int MSB = (int)responseData[4] & 0xff;
        int LSB = (int)responseData[3] & 0xff;
        int ADC = ((int)MSB << 8) + LSB;
        float extADC = (float) (((float) ADC / 4095.0) * 3.0);
        [myDrone setMeasuredADC:extADC];
        [myDrone setMeasuredADCInVolts:(((float)ADC/4095.0) * 3.0)];
        dispatch_sync(dispatch_get_main_queue(), ^{
            [myDrone notifyDelegate:@selector(doOnADCMeasured)];
        });
    }
    
    // Alt
    else if ([[self sensorType] isEqualToString:[myDrone TYPE_ALTITUDE_ENABLE]]) {
        [myDrone setAltitudeStatus:YES];
        dispatch_sync(dispatch_get_main_queue(), ^{
            [myDrone notifyDelegate:@selector(doOnAltitudeEnabled)];
        });
    }
    else if ([[self sensorType] isEqualToString:[myDrone TYPE_ALTITUDE_DISABLE]]) {
        [myDrone setAltitudeStatus:NO];
        dispatch_sync(dispatch_get_main_queue(), ^{
            [myDrone notifyDelegate:@selector(doOnAltitudeDisabled)];
        });
    }
    else if ([[self sensorType] isEqualToString:[myDrone TYPE_ALTITUDE_MEASURE]] && numberOfBytes > 3) {
        int MSB = (int)responseData[3] & 0xff;
        int LSB = (int) responseData[4] & 0xff;
        int pressureIntValue = (MSB << 8) + LSB;
        
        int pressureIntBits = ((int)responseData[5] & 0x0c) & 0xff;
        int pressureDecBits = ((int)responseData[5] & 0x03) & 0xff;
        float pascals = (float)((pressureIntValue << 2) + pressureIntBits + (pressureDecBits/4.0));
        
        float pRatio = (float) (pascals / 101326.0);
        float altitudeMeters = (float) ((1 - pow(pRatio, 0.1902632)) * 44330.77);
        
        [myDrone setMeasuredAltitudeInMeter:altitudeMeters];
        [myDrone setMeasuredAltitudeInFeet:(altitudeMeters * 3.2084)];
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            [myDrone notifyDelegate:@selector(doOnAltitudeMeasured)];
        });
    }
    
    // Bat. Volt.
    else if ([[self sensorType] isEqualToString:[myDrone TYPE_POWER_BATTERY_VOLTAGE]] && numberOfBytes > 2) {
        int MSB = (int)responseData[4] & 0xff;
        int LSB = (int)responseData[3] & 0xff;
        int ADC = (MSB << 8) + LSB;
        float voltage = (float) (((float) ADC / 4095.0) * 6.0);
        [myDrone setMeasuredBatteryVoltage:voltage];
        dispatch_sync(dispatch_get_main_queue(), ^{
            [myDrone notifyDelegate:@selector(doOnBatteryVoltageMeasured)];
        });
    } 
    
    // LED
    else if ([[self sensorType] isEqualToString:[myDrone TYPE_LED]]) {
        // Also check for low battery here
    }
    
    // Oxidizing Gas Sensor
    else if ([[self sensorType] isEqualToString:[myDrone TYPE_OXIDIZING_GAS_ENABLE]]) {
        [myDrone setOxidizingGasStatus:YES];
        dispatch_sync(dispatch_get_main_queue(), ^{
            [myDrone notifyDelegate:@selector(doOnOxidizingGasEnabled)];
        });
    }
    else if ([[self sensorType] isEqualToString:[myDrone TYPE_OXIDIZING_GAS_DISABLE]]) {
        [myDrone setOxidizingGasStatus:NO];
        dispatch_sync(dispatch_get_main_queue(), ^{
            [myDrone notifyDelegate:@selector(doOnOxidizingGasDisabled)];
        });
    }
    else if ([[self sensorType] isEqualToString:[myDrone TYPE_OXIDIZING_GAS_MEASURE]]) {
        // Notify
        int MSB = responseData[4] & 0xff;
        int LSB = responseData[3] & 0xff;
        int ADC = (MSB << 8) + LSB;
        float voltage = (float)ADC / 4095.0 * 3.3;
        float resistance = (18000.0 * 3.3 / voltage) - 18000.0;
        [myDrone setMeasuredOxidizingGasInOhm:resistance];
        dispatch_sync(dispatch_get_main_queue(), ^{
            [myDrone notifyDelegate:@selector(doOnOxidizingGasMeasured)];
        });
    }
    
    // Reducing Gas Sensor
    else if ([[self sensorType] isEqualToString:[myDrone TYPE_REDUCING_GAS_ENABLE]]) {
        [myDrone setOxidizingGasStatus:YES];
        dispatch_sync(dispatch_get_main_queue(), ^{
            [myDrone notifyDelegate:@selector(doOnOxidizingGasEnabled)];
        });
    }
    else if ([[self sensorType] isEqualToString:[myDrone TYPE_REDUCING_GAS_DISABLE]]) {
        [myDrone setOxidizingGasStatus:NO];
        dispatch_sync(dispatch_get_main_queue(), ^{
            [myDrone notifyDelegate:@selector(doOnOxidizingGasDisabled)];
        });
    }
    else if ([[self sensorType] isEqualToString:[myDrone TYPE_REDUCING_GAS_MEASURE]]) {
        // Notify
        int MSB = responseData[4] & 0xff;
        int LSB = responseData[3] & 0xff;
        int ADC = (MSB << 8) + LSB;
        float voltage = (float)ADC / 4095.0 * 3.3;
        float resistance = (270000.0 * 3.3 / voltage) - 270000.0;
        [myDrone setMeasuredReducingGasInOhm:resistance];
        dispatch_sync(dispatch_get_main_queue(), ^{
            [myDrone notifyDelegate:@selector(doOnOxidizingGasMeasured)];
        });
    }
    
    
    /////////////////////////////////////////////////////////////////////////////////////
    else {
        // wah wah
    }
    
    // On to the next job!
    [commLock unlock];
}


-(int)convertToInt:(unsigned char)bMSB :(unsigned char)LSB {
    int intMSB = (int)bMSB & 0x000000ff;
    int intLSB = (int)LSB & 0x000000ff;
    int returnValue = (intMSB << 8) + intLSB;
    return returnValue;
}

@end

