import 'package:flutter_test/flutter_test.dart';
import 'package:trial_task/model/crypto_currency_model.dart';

void main() {
  group('CryptoCurrencyModel', () {
    test('should create CryptoCurrencyModel from JSON', () {
      // Arrange
      final Map<String, dynamic> jsonData = {
        'data': [
          {
            'id': 1,
            'rank': 2,
            'name': 'Bitcoin',
            'symbol': 'BTC',
            'slug': 'bitcoin',
            'is_active': 1,
            'first_historical_data': '2013-04-28T18:47:21.000Z',
            'last_historical_data': '2023-04-28T18:47:21.000Z',
            'platform': {
              'id': 1,
              'name': 'Ethereum',
              'symbol': 'ETH',
              'slug': 'ethereum',
              'token_address': '0x1234567890abcdef',
            },
          },
        ],
        'status': {
          'timestamp': '2023-01-01T00:00:00.000Z',
          'error_code': null,
          'error_message': null,
          'elapsed': 10,
          'credit_count': 1,
        },
      };

      // Act
      final cryptoCurrencyModel = CryptoCurrencyModel.fromJson(jsonData);

      // Assert
      expect(cryptoCurrencyModel.data!.length, 1);
      expect(cryptoCurrencyModel.status, isNotNull);
    });

    test('should convert CryptoCurrencyModel to JSON', () {
      // Arrange
      final currencyDataList = [
        CurrencyData(
          id: 1,
          rank: 2,
          name: 'Bitcoin',
          symbol: 'BTC',
          slug: 'bitcoin',
          isActive: 1,
          firstHistoricalData: '2013-04-28T18:47:21.000Z',
          lastHistoricalData: '2023-04-28T18:47:21.000Z',
          platform: Platform(
            id: 1,
            name: 'Ethereum',
            symbol: 'ETH',
            slug: 'ethereum',
            tokenAddress: '0x1234567890abcdef',
          ),
        ),
      ];

      final status = Status(
        timestamp: '2023-01-01T00:00:00.000Z',
        errorCode: null,
        errorMessage: null,
        elapsed: 10,
        creditCount: 1,
      );

      final cryptoCurrencyModel =
          CryptoCurrencyModel(data: currencyDataList, status: status);

      // Act
      final result = cryptoCurrencyModel.toJson();

      // Assert
      expect(result['data'], isNotNull);
      expect(result['status'], isNotNull);
    });
  });
}
