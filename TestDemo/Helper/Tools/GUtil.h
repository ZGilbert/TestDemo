
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GUtil : NSObject

+(NSData*) dataBase64:(NSData*)theData;

+(void) setInfo:(id)value withKey:(NSString*)key;
+(void) removeInfo:(NSString*)key;
+(id) getInfo:(NSString*)key;

+(void) setInfoWithUid:(id)value withKey:(NSString*)key;
+(void) removeInfoWithUid:(NSString*)key;
+(id) getInfoWithUid:(NSString*)key;

+(UIAlertView*) alert:(NSString*)str;
+(BOOL) removeFile:(NSString*)filename;
+(BOOL) moveFile:(NSString*)srcName to:(NSString*)dstName;

+(NSString*) getUUID;
+ (NSString*)getDeviceVersion;
+ (NSString *)getOSVersion;
+ (NSString *)getAppVersion;
+ (NSString *)getIPAddress:(BOOL)preferIPv4;
+ (NSString *)getSIPAddress;
+(NSString*) getCachePath:(NSString*)name;
+(NSString*) getDocPath:(NSString*)name;
+(BOOL) phoneNumCheck:(NSString*)phone;
+(NSString*) processPhoneNumber:(NSString*)input trimOrAppend:(BOOL)trimsuffix;
+(UIImage *) thumbnailWithImageWithoutScale:(UIImage *)image size:(CGSize)asize;
+ (UIImage *)imageWithColor:(UIColor *)color;//根据颜色生成图片

+(NSString*) getTimeIntervalFrom1970:(NSString*)timeStr;
+(NSDate*) getDateFrom1970:(NSString*)timestr;
+(NSDate*) getDateFromStandTime:(NSString*)timestr;

+(BOOL) isUpDown:(NSInteger)imageOrientation;

@end


