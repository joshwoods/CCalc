//
//  NSString+RRAdditions.h
//
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCrypto.h>
#import <UIKit/UIKit.h>

@interface NSString (RRAdditions)

/**
 * Check if the string is null
 *
 * @return BOOL - YES if string is null
 */
- (BOOL)isNullString;

/**
 * Check if the string is a valid phone number
 *
 * @return BOOL - YES if string is a valid phone number
 */
- (BOOL)isValidPhoneNumber;

/**
 * Check if the string is a valid email address
 *
 * @return BOOL - YES if string is a valid email address
 */
- (BOOL)isValidEmail;

/**
 * Check if the string is a float
 *
 * @return BOOL - YES if string is a valid float
 */
- (BOOL)isFloat;

/**
 * Check if the string is a integer
 *
 * @return BOOL - YES if string is a valid integer
 */
- (BOOL)isInteger;

/**
 * Check if the string is a number
 *
 * @return BOOL - YES if string is a valid number
 */
- (BOOL)isNumeric;

/**
 * Converts a date to a URL string
 *
 * @param selectedDate NSDate to be converted
 * @return NSString - URL string from date
 */
+ (NSString *)dateToURLString:(NSDate *)selectedDate;

/**
 * Converts a date with time to a URL string
 *
 * @param selectedDate NSDate to be converted
 * @return NSString - URL string from date
 */
+ (NSString *)dateTimeToURLString:(NSDate *)selectedDate;

/**
 * Converts a date to a URL string, specifying use of natural language
 * (Natural language being Today/Tomorrow/Yesterday)
 *
 * @param selectedDate NSDate to be converted
 * @param naturalLanguage BOOL for using natural language
 * @return NSString - URL string from date
 */
+ (NSString *)dateToString:(NSDate *)selectedDate naturalLanguage:(BOOL)naturalLanguage;

/**
 * Gets the width of a string with a given font
 *
 * @param string NSString to be measured
 * @param font UIFont of the string to be measured
 * @return CGFloat Width of the string with the given font
 */
+ (CGFloat)widthOfString:(NSString *)string withFont:(UIFont *)font;

/**
 * Instance method that determines if a string contains a given substring
 *
 * @param subString NSString to check for
 * @param caseSensitive BOOL to check for capitals or not
 * @return BOOL - YES if the string contains the given substring
 */
- (BOOL)containsSubString:(NSString *)subString caseSensitive:(BOOL)caseSensitive;

/**
 * Returns an MD5 encrypted version of the string
 *
 * @return NSString - MD5 encrypted version of the string
 */
- (NSString *)MD5;

@end
