//
//  HZAdImpressionData.h
//
//
//
//  Copyright (c) 2019 Fyber. All rights reserved.
//

typedef NS_ENUM(NSUInteger, HZPricingType) {
    HZPricingTypeUnknown,
    HZPricingTypeProgrammatic,
    HZPricingTypePredicted,
};

@interface HZAdImpressionData : NSObject

/**
 *  @brief The eCPM value.
 *
 *  @discussion `nil` in case of missing value or `OfferWall` unit.
 */
@property (nonatomic, strong, readonly, nullable) NSNumber *eCPM;

/**
 *  @brief The pricing type.
 *
 *  @discussion The `HZPricingTypeProgrammatic` is for exchange; the `HZPricingTypePredicted` is for a mediated network.
 */
@property (nonatomic, readonly) HZPricingType pricingType;

+ (nonnull NSString *)pricingTypeAsString:(HZPricingType)pricingType;

@end
