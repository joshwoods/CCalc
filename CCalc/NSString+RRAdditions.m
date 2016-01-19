//
//  NSString+RRAdditions.m
//
//

#import "NSString+RRAdditions.h"

@implementation NSString (RRAdditions)

- (BOOL)isNullString
{
    
    if (![self isKindOfClass:[NSString class]] || !self)
    {
        return YES;
    }
    
    if (self == nil
        || self == (id)[NSNull null]
        || self.length == 0
        || [self isEqualToString:@""]
        || [self isEqualToString:@"null"]
        || [self isEqualToString:@"(null)"]
        || [self isEqualToString:@"<null>"]) {
        return YES;
    }
    return NO;
}

- (BOOL)isValidPhoneNumber
{
    NSError *error = nil;
    NSDataDetector *detector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypePhoneNumber
                                                               error:&error];
    NSUInteger numberOfMatches = [detector numberOfMatchesInString:self
                                                           options:0
                                                             range:NSMakeRange(0, [self length])];
    return numberOfMatches > 0;
}

- (BOOL)isValidEmail
{
	// validate data
	BOOL validated = YES;
    
	if( [self length] == 0 ) validated = NO;
	
	// check for email address
	NSString *emailStr = [self lowercaseString];
    NSString *emailRegEx =
    @"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"
    @"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
    @"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
    @"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
    @"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
    @"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
    @"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
    
    NSPredicate *regExPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    BOOL myStringMatchesRegEx = [regExPredicate evaluateWithObject:emailStr];
	if( myStringMatchesRegEx == NO ) validated = NO;
	
	return validated;
}

- (BOOL)isInteger
{
    NSScanner *scan = [NSScanner scannerWithString:self];
    int value;
    return [scan scanInt:&value] && [scan isAtEnd];
}

- (BOOL)isFloat
{
    return [[NSScanner scannerWithString:self] scanFloat:NULL];
}

- (BOOL)isNumeric
{
    NSScanner *scan = [NSScanner scannerWithString:self];
    double value;
    return [scan scanDouble:&value] && [scan isAtEnd];
}

+ (NSString *)dateToURLString:(NSDate *)selectedDate {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM/dd/yyyy"];
    NSString *dateString = [dateFormatter stringFromDate:selectedDate];
    //dateString = [dateString stringByAddingURLEncoding];
    
    return dateString;
}

+ (NSString *)dateTimeToURLString:(NSDate *)selectedDate {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM/dd/yyyy HH:mm:ss"];
    NSString *dateString = [dateFormatter stringFromDate:selectedDate];
    //dateString = [dateString stringByAddingURLEncoding];
    
    return dateString;
}

+ (NSString *)dateToString:(NSDate *)selectedDate naturalLanguage:(BOOL)naturalLanguage {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //[dateFormatter setDateFormat:@"MM/dd/yyyy"];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    //[dateFormatter doesRelativeDateFormatting];
    NSString *dateString = [dateFormatter stringFromDate:selectedDate];
    
    if (naturalLanguage)
    {
        NSDate *today = [NSDate date];
        NSDate *yesterday = [today dateByAddingTimeInterval: -86400.0];
        NSDate *tomorrow = [today dateByAddingTimeInterval: 86400.0];
        
        // generate strings for comparison
        NSString *nowString = [dateFormatter stringFromDate:today];
        NSString *tomorrowString = [dateFormatter stringFromDate:tomorrow];
        NSString *yesterdayString = [dateFormatter stringFromDate:yesterday];
        
        if ([dateString isEqualToString:nowString])
        {
            return @"Today";
        }
        else if ([dateString isEqualToString:tomorrowString])
        {
            return @"Tomorrow";
        }
        else if ([dateString isEqualToString:yesterdayString])
        {
            return @"Yesterday";
        }
    }
    
    return dateString;
}

+ (CGFloat)widthOfString:(NSString *)string withFont:(UIFont *)font
{
    if([string isNullString])
    {
        return 0.0;
    }
    
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
    return [[[NSAttributedString alloc] initWithString:string attributes:attributes] size].width;
}

- (BOOL)containsSubString:(NSString *)subString caseSensitive:(BOOL)caseSensitive
{
    if (!caseSensitive)
    {
        subString = [subString lowercaseString];
        NSString *lowerSelfString = [self lowercaseString];
        
        if ([lowerSelfString rangeOfString:subString].location == NSNotFound)
        {
            return NO;
        }
        else
        {
            return YES;
        }
    }
    
    if ([self rangeOfString:subString].location == NSNotFound)
    {
        return NO;
    }
    else
    {
        return YES;
    }
}

- (NSString*)MD5
{
    // Create pointer to the string as UTF8
    const char *ptr = [self UTF8String];
    
    // Create byte array of unsigned chars
    unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];
    
    // Create 16 byte MD5 hash value, store in buffer
    CC_MD5(ptr, (CC_LONG)strlen(ptr), md5Buffer);
    
    // Convert MD5 value in the buffer to NSString of hex values
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x",md5Buffer[i]];
    
    return output;
}

@end
