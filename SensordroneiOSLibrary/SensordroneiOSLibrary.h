//
//  SensordroneiOSLibrary.h
//  SensordroneiOSLibrary
//
//  Created by Mark Rudolph on 5/13/13.
//  Copyright (c) 2013 Sensorcon, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>

// We have not yet implemented specific LE characteristics for different types of events,
// so for now we make the asynchronous BLE behave like a FIFO type of operation, and use these
// protocols to allow a user to decide what happens when a particular event occurs.
//
// They are optional, and this Library should check if the implementing class responds, and if so,
// fire the method.
@protocol DroneEventDelegate <NSObject>

@optional
// BLE
-(void) doOnFoundDrone;
-(void) doOnConnect;
-(void) doOnDisconnect;
-(void) doOnConnectionLost;
-(void) doOnConnectionFailed;
// Temperature
-(void) doOnAmbientTemperatureMeasured;
-(void) doOnAmbientTemperatureStatusChecked;
-(void) doOnAmbientTemperatureEnabled;
-(void) doOnAmbientTemperatureDisabled;
// Humidity
-(void) doOnHumidityMeasured;
-(void) doOnHumidityStatusChecked;
-(void) doOnHumidityEnabled;
-(void) doOnHumidityDisabled;
// Pressure
-(void) doOnPressureMeasured;
-(void) doOnPressureStatusChecked;
-(void) doOnPressureEnabled;
-(void) doOnPressureDisabled;
// Altitude
-(void) doOnAltitudeMeasured;
-(void) doOnAltitudeStatusChecked;
-(void) doOnAltitudeEnabled;
-(void) doOnAltitudeDisabled;
// RGBC
-(void) doOnRGBCMeasured;
-(void) doOnRGBCStatusChecked;
-(void) doOnRGBCEnabled;
-(void) doOnRGBCDisabled;
// Precision
-(void) doOnPrecisonGasMeasured;
-(void) doOnPrecisonGasStatusChecked;
-(void) doOnPrecisonGasEnabled;
-(void) doOnPrecisonGasDisabled;
// capacitance
-(void) doOnCapacitanceMeasured;
-(void) doOnCapacitanceEnabled;
-(void) doOnCapacitanceDisabled;
-(void) doOnCapacitanceStatusChecked;
// IR
-(void) doOnIRTemperatureMeasured;
-(void) doOnIRTemperatureStatusChecked;
-(void) doOnIRTemperatureEnabled;
-(void) doOnIRTemperatureDisabled;
// Oxidizing
-(void) doOnOxidizingGasMeasured;
-(void) doOnOxidizingGasStatusChecked;
-(void) doOnOxidizingGasEnabled;
-(void) doOnOxidizingGasDisabled;
// Reducing
-(void) doOnReducingGasMeasured;
-(void) doOnReducingGasStatusChecked;
-(void) doOnReducingGasEnabled;
-(void) doOnReducingGasDisabled;
// ADC
-(void) doOnADCMeasured;
-(void) doOnADCStatusChecked;
-(void) doOnADCEnabled;
-(void) doOnADCDisabled;
// UART
-(void) doOnUARTRead;
// USBUSRT
-(void) doOnUSBUSARTRead;
// I2C
-(void) doOnI2CRead;
// Power
-(void) doOnBatteryVoltageMeasured;
-(void) donOnChargingStatusChecked;
-(void) doOnLowBattery;
@end

@interface Drone : NSObject <CBCentralManagerDelegate, CBPeripheralDelegate, DroneEventDelegate> {
    id<DroneEventDelegate> delegate;
    NSMutableDictionary *ledColors;
}

// We need an operation queue to make BLE act like FIFO
@property NSOperationQueue *jobQueue;
// Our CoreBluetooth properties
@property CBCentralManager *btleManger;
@property CBPeripheral *dronePeripheral;
@property CBUUID *droneCBUUID;
@property id <DroneEventDelegate> delegate;
// Our BLE characteristics and their UUIDs.
// The 'Credits' are not really used, but are included here.
// They basically behave as in indicator of the length of the tx read/write
@property CBCharacteristic *txCharacteristic;
@property CBUUID *txCharacteristicUUID;
@property CBCharacteristic *txCreditCharacteristic;
@property CBUUID *txCreditCharacteristicUUID;
@property CBCharacteristic *rxCharacteristic;
@property CBUUID *rxCharacteristicUUID;
@property CBCharacteristic *rxCreditCharacteristic;
@property CBUUID *rxCreditCharacteristicUUID;


@property float precisionGasCalibratedBasline;
@property float precisionGasCalibrateSensitivity;
@property int irVobj;

// These are strings used to match a job event read/write type.
// We Create an NSOperation that is of a specific type (i.e. temperature read).
// We assign the NSOperation this string so it knows what it is / how to parse the result
// once it is submitted.
//
// There is no reason these couldn't be changed to ints, or something else, as long as they
// are unique, and lets the NSOperation know the 'type' so it can parse the result correctly.
@property NSString *TYPE_GENERAL;

@property NSString *TYPE_TEMPERATURE_MEASURE;
@property NSString *TYPE_TEMPERATURE_ENABLE;
@property NSString *TYPE_TEMPERATURE_DISABLE;
@property NSString *TYPE_TEMPERATURE_STATUS;

@property NSString *TYPE_HUMIDITY_MEASURE;
@property NSString *TYPE_HUMIDITY_ENABLE;
@property NSString *TYPE_HUMIDITY_DISABLE;
@property NSString *TYPE_HUMIDITY_STATUS;

@property NSString *TYPE_PRESSURE_MEASURE;
@property NSString *TYPE_PRESSURE_ENABLE;
@property NSString *TYPE_PRESSURE_DISABLE;
@property NSString *TYPE_PRESSURE_STATUS;

@property NSString *TYPE_ALTITUDE_MEASURE;
@property NSString *TYPE_ALTITUDE_ENABLE;
@property NSString *TYPE_ALTITUDE_DISABLE;
@property NSString *TYPE_ALTITUDE_STATUS;

@property NSString *TYPE_RGBC_MEASURE;
@property NSString *TYPE_RGBC_ENABLE;
@property NSString *TYPE_RGBC_DISABLE;
@property NSString *TYPE_RGBC_STATUS;


@property NSString *TYPE_PRECISION_READ_CALIBRATION;
@property NSString *TYPE_PRECISION_GAS_MEASURE;
@property NSString *TYPE_PRECISION_GAS_ENABLE;
@property NSString *TYPE_PRECISION_GAS_DISABLE;
@property NSString *TYPE_PRECISION_GAS_STATUS;

@property NSString *TYPE_OXIDIZING_GAS_MEASURE;
@property NSString *TYPE_OXIDIZING_GAS_ENABLE;
@property NSString *TYPE_OXIDIZING_GAS_DISABLE;
@property NSString *TYPE_OXIDIZING_GAS_STATUS;

@property NSString *TYPE_REDUCING_GAS_MEASURE;
@property NSString *TYPE_REDUCING_GAS_ENABLE;
@property NSString *TYPE_REDUCING_GAS_DISABLE;
@property NSString *TYPE_REDUCING_GAS_STATUS;

@property NSString *TYPE_CAPACITANCE_MEASURE;
@property NSString *TYPE_CAPACITANCE_ENABLE;
@property NSString *TYPE_CAPACITANCE_DISABLE;
@property NSString *TYPE_CAPACITANCE_STATUS;

@property NSString *TYPE_IR_TEMPERATURE_MEASURE;
@property NSString *TYPE_IR_TEMPERATURE_MEASURE_B;
@property NSString *TYPE_IR_TEMPERATURE_ENABLE;
@property NSString *TYPE_IR_TEMPERATURE_DISABLE;
@property NSString *TYPE_IR_TEMPERATURE_STATUS;

@property NSString *TYPE_ADC_MEASURE;
@property NSString *TYPE_ADC_ENABLE;
@property NSString *TYPE_ADC_DISABLE;
@property NSString *TYPE_ADC_STATUS;

@property NSString *TYPE_UART_READ;
@property NSString *TYPE_UART_WRITE;
@property NSString *TYPE_USB_UART_READ;
@property NSString *TYPE_USB_UART_WRITE;
@property NSString *TYPE_I2C_READ;
@property NSString *TYPE_I2C_WRITE;
@property NSString *TYPE_LED;
@property NSString *TYPE_POWER_BATTERY_VOLTAGE;
@property NSString *TYPE_POWER_CHARGING_STATUS;

@property NSString *TYPE_DISCONNECT;



// Our Core Bluetooth (related) Methods
-(void) scanForDrones;
-(void) stopScanningForDrones;
-(void) btleConnect:(CBPeripheral *)aPeripheral;
-(void) disconnect;
@property  BOOL isDroneConnected;
-(id)initWithDelegate:(id<DroneEventDelegate>)droneEventDelegate;
-(void)notifyDelegate:(SEL)selector;

@property NSMutableArray *scannedDronePeriperals;
@property NSMutableArray *scannedDroneNames;


// Drone things
-(void) checkIfDroneIsCharging;
@property  BOOL isDroneCharging;
-(void) measureDroneBatteryVoltage;
@property float measuredBatteryVoltage;

-(void) sendLECommand:(unsigned char[])command :(int)arrayLength :(NSString*)sensorType;
-(void) parseResponse:(NSData *)response;

-(void) setLeftLED:(int)RED :(int) GREEN :(int) BLUE;
-(void) setRightLED:(int)RED :(int) GREEN :(int) BLUE;
-(void) setLEDs:(int)RED :(int) GREEN :(int) BLUE;

-(void) clearJobQueue;
//
// Ambient Temperature
//
-(void) enableAmbientTemperature;
-(void) disableAmbientTemperature;
-(void) checkAmbientTemperatureStatus;
-(void) measureAmbientTemperature;

@property  BOOL ambientTemperatureStatus;
@property float measuredAmbientTemperatureInFahreneit;
@property float measuredAmbientTemperatureInCelcius;
@property float measuredAmbientTemperatureInKelvin;

//
// Humidity
//
-(void) enableHumidity;
-(void) disableHumidity;
-(void) checkHumidityStatus;
-(void) measureHumidity;

@property  BOOL humidityStatus;
@property float measuredPercentHumidity;

//
// Pressure
//
-(void) enablePressure;
-(void) disablePressure;
-(void) checkPressureStatus;
-(void) measurePressure;

@property  BOOL pressureStatus;
@property float measuredPressureInPascal;
@property float measuredPressureInAtmosphere;
@property float measuredPressureInTorr;

//
// Altitude
//
-(void) enableAltitude;
-(void) disableAltitude;
-(void) checkAltitudeStatus;
-(void) measureAltitude;

@property  BOOL altitudeStatus;
@property float measuredAltitudeInFeet;
@property float measuredAltitudeInMeter;

//
// R G B C Color Sensor
//
-(void) enableRGBC;
-(void) disableRGBC;
-(void) checkRGBCStatus;
-(void) measureRGBC;

@property  BOOL rgbcStatus;
@property float measuredRGBCRedChannel;
@property float measuredRGBCGreenChannel;
@property float measuredRGBCBlueChannel;
@property float measuredRGBCClearChannel;
@property float measuredRGBCIlluminanceInLux;
@property float measuredRGBCColorTemperatureInKelvin;

//
// IR Non-Contact Temperature
//
-(void) enableIRTemperature;
-(void) disableIRTemperature;
-(void) checkIRTemperatureStatus;
-(void) measureIRTemperature;

@property  BOOL irTemperatureStatus;
@property float measuredIRTemperatureInFahreneit;
@property float measuredIRTemperatureInCelcius;
@property float measuredIRTemperatureInKelvin;

//
// Precision Gas
//
-(void) enablePrecisionGas;
-(void) disablePrecisionGas;
-(void) checkPrecisionGasStatus;
-(void) measurePrecisionGas;

@property  BOOL precisiongGasStatus;
@property float measuredPrecisionGasInPPMCO;

//
// Oxidizing Gas
//
-(void) enableOxidizingGas;
-(void) disableOxidizingGas;
-(void) checkOxidizingGasStatus;
-(void) measureOxidizingGas;

@property  BOOL oxidizingGasStatus;
@property float *measuredOxidizingGasInOhm;

//
// Reducing Gas
//
-(void) enableReducingGas;
-(void) disableReducingGas;
-(void) checkReducingGasStatus;
-(void) measureReducingGas;

@property  BOOL reducingGasStatus;
@property float *measuredReducingGasInOhm;

//
// External ADC
//
-(void) enableADC;
-(void) disableADC;
-(void) checkADCStatus;
-(void) measureADC;

@property  BOOL adcStatus;
@property float measuredADC;
@property float measuredADCInVolts;

//
// Capacitance
//
-(void) enableCapacitance;
-(void) disableCapacitance;
-(void) checkCapacitanceStatus;
-(void) measureCapacitance;

@property BOOL capacitanceStatus;
@property float measuredCapacitanceInFemtoFarad;

//
// External UART
//
-(void) writeToUART:(char*[] )data;
-(void) readFromUART;

@property  NSData *dataReadFromUART;

//
// External I2C
//
-(void) i2cWrite:(char*[]) data;
-(void) i2cRead;

@property  NSData *dataReadFromI2C;


@end

// The NSOperation we use to get data.
//
// The basic operation is that a job is submitted in a background queue of size 1
// (all communication goes through this job queue).
//
// The NSOperation makes a call over BLE and blocks the background queue thread until it gets a response.
// The response in the CoreBluetooth callback updates the NSOperation with the result, releases the lock on
// the NSOperations thread, and it goes about it's business.
//
@interface leCommand : NSOperation
// This is used as a semaphore
@property NSCondition *commLock;

//
@property Drone *myDrone;
@property NSData *command;
@property NSString *sensorType;

// BLE Response
@property BOOL hasResponse;
@property NSData *response;

// A method to convert an Most Significant Byte and a Least Significant Byte to an int.
-(int) convertToInt:(unsigned char)MSB :(unsigned char)LSB;

@end


