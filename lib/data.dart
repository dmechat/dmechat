import 'dart:math' as math;

import 'package:dmechat/core/models/models.dart';
import 'package:faker/faker.dart';
import 'package:dice_bear/dice_bear.dart';

var r = math.Random();
var f = Faker();

// Build contacts
var contacts = List.filled(
  30,
  1,
).map(
  (v) => Contact(
    name: f.person.name(),
    accountId: "${f.internet.userName()}.guests.dmechat.testnet",
    imageUrl:
        DiceBearBuilder(seed: f.internet.userName()).build().svgUri.toString(),
    isFavorite: f.randomGenerator.boolean(),
    isArchived: f.randomGenerator.boolean(),
  ),
);

var currentUser = Contact(
  name: f.person.name(),
  accountId: "${f.internet.userName()}.guests.dmechat.testnet",
  imageUrl:
      DiceBearBuilder(seed: f.internet.userName()).build().svgUri.toString(),
  isFavorite: f.randomGenerator.boolean(),
  isArchived: f.randomGenerator.boolean(),
);

// Build rooms
var rooms = List.filled(
  12,
  1,
).map(
  (r) => Room(
    name: f.conference.name(),
    isArchived: f.randomGenerator.boolean(),
  ),
);

// Build chat messages
var chatMessages = contacts.map(
  (e) => Chat(
    id: f.guid.guid(),
    memberAccountIds: [currentUser.accountId, e.accountId],
    visibleMessages: List.filled(f.randomGenerator.numbers(25, 1).first, 1).map(
      (v) => ChatMessage(
        content: Faker()
            .lorem
            .sentences(math.min(f.randomGenerator.numbers(2, 1).first, 1))
            .join("."),
        id: f.guid.guid(),
        isDelivered: f.randomGenerator.boolean(),
        isEdited: f.randomGenerator.boolean(),
        isRead: f.randomGenerator.boolean(),
        senderAccountId: Faker()
            .randomGenerator
            .element([currentUser.accountId, e.accountId]),
        timestamp: f.date.dateTime(maxYear: 2022, minYear: 2021),
        type: f.randomGenerator.element(MessageType.values),
      ),
    ),
  ),
);

// Build call logs
var callLogs = contacts
    .map(
      (e) => f.randomGenerator.boolean()
          ? null
          : CallLog(
              action: f.randomGenerator.element(CallAction.values),
              duration: Duration(
                seconds: f.randomGenerator.numbers(600, 1).first,
              ),
              isMissed: f.randomGenerator.boolean(),
              memberAccountIds: [currentUser.accountId, e.accountId],
              timestamp: f.date.dateTime(maxYear: 2022, minYear: 2021),
              type: f.randomGenerator.element(CallType.values),
            ),
    )
    .where((element) => element != null);

// Build Wallet
var wallet = Wallet(
  address: currentUser.accountId,
  balances: [],
  nativeBalance: TokenBalance(
    balance: f.randomGenerator.decimal(scale: 100, min: 0.1),
    id: 'NEAR',
    tokenContractAddress: null,
    tokenName: "NEAR",
  ),
);
