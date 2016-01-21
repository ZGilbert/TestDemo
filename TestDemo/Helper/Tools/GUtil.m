
#import "GUtil.h"
#import <math.h>
//#import "GDefine.h"
//#import "NSString_Extras.h"
//#import "AppDelegate.h"
#import <sys/utsname.h>
#import <netdb.h>

#include <ifaddrs.h>
#include <arpa/inet.h>
#include <net/if.h>
//#import "YTKNetworkAgent.h"

#define IOS_CELLULAR    @"pdp_ip0"
#define IOS_WIFI        @"en0"
#define IOS_VPN         @"utun0"
#define IP_ADDR_IPv4    @"ipv4"
#define IP_ADDR_IPv6    @"ipv6"

#define GID @"userID"
#define LTXT(s) NSLocalizedString(@"" #s "", nil)
#define KBundleName [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"]
#define KAppName [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"]
#define KBundleIdentifier [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIdentifier"]

#define AppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define IosVersion floorf([[[UIDevice currentDevice] systemVersion] floatValue])

@implementation GUtil

+(NSData*) dataBase64:(NSData*)theData
{
	const uint8_t* input=(const uint8_t*)[theData bytes];
	NSInteger length=[theData length];
	
    static char table[]="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
	
    NSMutableData* data=[NSMutableData dataWithLength:((length + 2) / 3) * 4];
    uint8_t* output=(uint8_t*)data.mutableBytes;
	
	NSInteger i;
    for (i=0; i < length; i += 3)
    {
        NSInteger value=0;
		NSInteger j;
        for (j=i; j < (i + 3); j++)
        {
            value <<= 8;
            if(j < length)
                value |= (0xFF & input[j]);
        }
		
        NSInteger theIndex=(i / 3) * 4;
        output[theIndex + 0]=                   table[(value >> 18) & 0x3F];
        output[theIndex + 1]=                   table[(value >> 12) & 0x3F];
        output[theIndex + 2]=(i + 1) < length ? table[(value >> 6)  & 0x3F] : '=';
        output[theIndex + 3]=(i + 2) < length ? table[(value >> 0)  & 0x3F] : '=';
    }
	
    return data;
}

+(void) setInfo:(id)value withKey:(NSString*)key
{
    if(value==nil)
        return;
    
    [GUtil removeInfo:key];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:value forKey:key];
    [defaults synchronize];
}

+(void) removeInfo:(NSString*)key
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:key];
    [defaults synchronize];
}

+(id) getInfo:(NSString*)key
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

+(void) setInfoWithUid:(id)value withKey:(NSString*)key
{
    if(value==nil)
        return;
    
    if(GID)
    {
        key = [NSString stringWithFormat:@"%@_%@",GID,key];
    }
    [GUtil removeInfo:key];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    
    [defaults setObject:value forKey:key];
    [defaults synchronize];
}

+(void) removeInfoWithUid:(NSString*)key
{
    if(GID)
    {
        key = [NSString stringWithFormat:@"%@_%@",GID,key];
    }
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:key];
    [defaults synchronize];
}

+(id) getInfoWithUid:(NSString*)key
{
	if(GID)
    {
        key = [NSString stringWithFormat:@"%@_%@",GID,key];
    }
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

+(UIAlertView*) alert:(NSString*)msg
{	
	UIAlertView* alert=[[UIAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:LTXT(PP_OK) otherButtonTitles:nil, nil];
	[alert show];
	
    return alert;
}

+(BOOL) removeFile:(NSString*)filename
{
    NSFileManager* file=[NSFileManager defaultManager];
    NSError* err=nil;
    return [file removeItemAtPath:filename error:&err];
}

+(BOOL) moveFile:(NSString*)srcName to:(NSString*)dstName
{
    NSFileManager* file=[NSFileManager defaultManager];
    NSError* err=nil;
    return [file moveItemAtPath:srcName toPath:dstName error:&err];
}

+(NSString*) getUUID
{
	CFUUIDRef theUUID = CFUUIDCreate(NULL);
	CFStringRef string = CFUUIDCreateString(NULL, theUUID);
	NSString* resSTr=[NSString stringWithString:(__bridge NSString*)string];
	
	CFRelease(theUUID);
	CFRelease(string);
	return resSTr;
}

+ (NSString *)getDeviceVersion
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.nodename encoding:NSUTF8StringEncoding];
    return deviceString;
}
#define SF2(a1,a2) [NSString stringWithFormat:@"%@%@",a1,a2]

+ (NSString *)getOSVersion
{
    return SF2([UIDevice currentDevice].systemName, [UIDevice currentDevice].systemVersion);
}

+ (NSString *)getAppVersion
{
    return SF2(KBundleName, AppVersion);
}

#pragma mark - for ip
+ (NSString *)getIPAddress:(BOOL)preferIPv4
{
    NSArray *searchArray = preferIPv4 ?
    @[ IOS_VPN @"/" IP_ADDR_IPv4, IOS_VPN @"/" IP_ADDR_IPv6, IOS_WIFI @"/" IP_ADDR_IPv4, IOS_WIFI @"/" IP_ADDR_IPv6, IOS_CELLULAR @"/" IP_ADDR_IPv4, IOS_CELLULAR @"/" IP_ADDR_IPv6 ] :
    @[ IOS_VPN @"/" IP_ADDR_IPv6, IOS_VPN @"/" IP_ADDR_IPv4, IOS_WIFI @"/" IP_ADDR_IPv6, IOS_WIFI @"/" IP_ADDR_IPv4, IOS_CELLULAR @"/" IP_ADDR_IPv6, IOS_CELLULAR @"/" IP_ADDR_IPv4 ] ;
    
    NSDictionary *addresses = [self getIPAddresses];
    NSLog(@"addresses: %@", addresses);
    
    __block NSString *address;
    [searchArray enumerateObjectsUsingBlock:^(NSString *key, NSUInteger idx, BOOL *stop)
     {
         address = addresses[key];
         if(address) *stop = YES;
     } ];
    return address ? address : @"0.0.0.0";
}

+ (NSDictionary *)getIPAddresses
{
    NSMutableDictionary *addresses = [NSMutableDictionary dictionaryWithCapacity:8];
    
    // retrieve the current interfaces - returns 0 on success
    struct ifaddrs *interfaces;
    if(!getifaddrs(&interfaces)) {
        // Loop through linked list of interfaces
        struct ifaddrs *interface;
        for(interface=interfaces; interface; interface=interface->ifa_next) {
            if(!(interface->ifa_flags & IFF_UP) /* || (interface->ifa_flags & IFF_LOOPBACK) */ ) {
                continue; // deeply nested code harder to read
            }
            const struct sockaddr_in *addr = (const struct sockaddr_in*)interface->ifa_addr;
            char addrBuf[ MAX(INET_ADDRSTRLEN, INET6_ADDRSTRLEN) ];
            if(addr && (addr->sin_family==AF_INET || addr->sin_family==AF_INET6)) {
                NSString *name = [NSString stringWithUTF8String:interface->ifa_name];
                NSString *type;
                if(addr->sin_family == AF_INET) {
                    if(inet_ntop(AF_INET, &addr->sin_addr, addrBuf, INET_ADDRSTRLEN)) {
                        type = IP_ADDR_IPv4;
                    }
                } else {
                    const struct sockaddr_in6 *addr6 = (const struct sockaddr_in6*)interface->ifa_addr;
                    if(inet_ntop(AF_INET6, &addr6->sin6_addr, addrBuf, INET6_ADDRSTRLEN)) {
                        type = IP_ADDR_IPv6;
                    }
                }
                if(type) {
                    NSString *key = [NSString stringWithFormat:@"%@/%@", name, type];
                    addresses[key] = [NSString stringWithUTF8String:addrBuf];
                }
            }
        }
        // Free memory
        freeifaddrs(interfaces);
    }
    return [addresses count] ? addresses : nil;
}
#define ValidArray(f) (f!=nil && [f isKindOfClass:[NSArray class]] && [f count]>0)
+ (NSString *)getSIPAddress
{
    NSString *hostname = [[NSURL URLWithString:@"http://weibo.com"] host];
    CFHostRef hostRef = CFHostCreateWithName(kCFAllocatorDefault, (__bridge CFStringRef)hostname);
    NSString *strDNS = @"0.0.0.0";
    if (hostRef)
    {
        Boolean result = CFHostStartInfoResolution(hostRef, kCFHostAddresses, NULL);
        if (result == TRUE)
        {
            NSArray *addresses = (__bridge NSArray*)CFHostGetAddressing(hostRef, &result);
            if (ValidArray(addresses)) {
                struct sockaddr_in* remoteAddr;
                CFDataRef saData = (CFDataRef)CFArrayGetValueAtIndex((__bridge CFArrayRef)addresses, 0);
                remoteAddr = (struct sockaddr_in*)CFDataGetBytePtr(saData);
                
                if(remoteAddr != NULL)
                {
                    const char *strIP41 = inet_ntoa(remoteAddr->sin_addr);
                    strDNS =[NSString stringWithCString:strIP41 encoding:NSASCIIStringEncoding];
                }
            }
        }
    }
    return strDNS;
}

+(NSString*) getCachePath:(NSString*)name
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
	NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
	return [basePath stringByAppendingPathComponent:name];
}

+(NSString*) getDocPath:(NSString*)name
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
	return [basePath stringByAppendingPathComponent:name];
}

+(BOOL) phoneNumCheck:(NSString*)phone
{
//	NSString* phoneExpression=[NSString stringWithUTF8String:"^[0-9]{8,16}$"];    
//	return [phone grep:phoneExpression options:REG_ICASE];
    return YES;
}

+(NSString*) processPhoneNumber:(NSString*)input trimOrAppend:(BOOL)trimsuffix
{
	NSString* phonenum = nil;
	if (trimsuffix)
    {
        phonenum = [input stringByReplacingCharactersInRange:NSMakeRange(0, 2) withString:@""];
	}
    else
    {
		if ([input length] == 11)
        {
			phonenum = [NSString stringWithFormat:@"86%@", input];
		}
        else
        {
			phonenum = input;
		}
	}
	return phonenum;
}

+(UIImage*) thumbnailWithImageWithoutScale:(UIImage *)image size:(CGSize)asize
{
    UIImage *newimage;
    if (nil == image)
    {
        newimage = nil;
    }
    else
    {
        CGSize oldsize = image.size;
        CGRect rect;
        if (asize.width/asize.height > oldsize.width/oldsize.height)
        {
            rect.size.width = asize.height*oldsize.width/oldsize.height;
            rect.size.height = asize.height;
            rect.origin.x = (asize.width - rect.size.width)/2;
            rect.origin.y = 0;
        }
        else
        {
            rect.size.width = asize.width;
            rect.size.height = asize.width*oldsize.height/oldsize.width;
            rect.origin.x = 0;
            rect.origin.y = (asize.height - rect.size.height)/2;
        }
        
        UIGraphicsBeginImageContext(asize);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, [[UIColor blackColor] CGColor]);
        UIRectFill(CGRectMake(0, 0, asize.width, asize.height));//clear background
        [image drawInRect:rect];
        newimage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    return newimage;
}

+(NSString *) getTimeIntervalFrom1970:(NSString*)timeStr
{
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [dateFormatter setDateFormat:@"EEE, d MMM yyyy HH:mm:ss Z"];
    //Wed, 31 Oct 2012 10:14:00 +0800
    NSDate *time=[dateFormatter dateFromString:timeStr];
    NSString *timeSp = [NSString stringWithFormat:@"%f", [time timeIntervalSince1970]];
    return timeSp;
}

+(NSDate*) getDateFromStandTime:(NSString*)timestr
{
	NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
	[dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [dateFormatter setDateFormat:@"EEE, d MMM yyyy HH:mm:ss Z"];
    //Wed, 31 Oct 2012 10:14:00 +0800
    NSDate *time=[dateFormatter dateFromString:timestr];
    
    return time;
}

+(NSDate*) getDateFrom1970:(NSString*)timestr
{
    double timed = [timestr doubleValue];
    NSDate *time=[NSDate dateWithTimeIntervalSince1970:timed];
    
    return time;
}

+(BOOL) isUpDown:(NSInteger)imageOrientation
{
    return (imageOrientation==UIImageOrientationUp ||
            imageOrientation==UIImageOrientationDown ||
            imageOrientation==UIImageOrientationUpMirrored ||
            imageOrientation==UIImageOrientationDownMirrored);
}

+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
