//
//  EngineEnumWrapper.h
//  VectorEngine
//
//  Created by Russell Finn on 6/3/18.
//  Copyright © 2018 The Spruce Hill Group. All rights reserved.
//

#ifndef EngineEnumWrapper_h
#define EngineEnumWrapper_h

#import <Foundation/Foundation.h>

// Because Suit is used in the C++ struct Card, it must be defined
// in terms of the underlying C++ type (int), not NSInteger.
typedef NS_ENUM (int, Suit)
{
    SuitClubs,
    SuitDiamonds,
    SuitHearts,
    SuitSpades,
    SuitNoTrump,
    SuitNoSuit
};


// Because Player is used in C++ structs like ParContractAnalysis,
// it must be defined in terms of the underlying C++ type (int), not NSInteger.
typedef NS_ENUM (int, Player)
{
    PlayerNorth,
    PlayerEast,
    PlayerSouth,
    PlayerWest,
    PlayerNoPlayer
};

/// Option set containing values corresponding to the `Player` enum.
///
/// This type corresponds to the Engine C++ type `aBoolPlayer4`.
typedef NS_OPTIONS (NSInteger, PlayerOptionSet)
{
    PlayerOptionSetNone  = 0,
    PlayerOptionSetNorth = (1 << 0),
    PlayerOptionSetEast  = (1 << 1),
    PlayerOptionSetSouth = (1 << 2),
    PlayerOptionSetWest  = (1 << 3)
};

typedef NS_ENUM (NSInteger, Partnership)
{
    PartnershipNorthSouth,
    PartnershipEastWest,
    PartnershipNoPartnership
};

#endif /* EngineEnumWrapper_h */
