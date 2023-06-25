import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:redux_app/api/datasource.dart';
import 'package:redux_app/api/model/cat.dart';
import 'package:redux_app/api/repo.dart';

class MockApiDataSource extends Mock implements CatDataSource {}

void main() {
  late CatRepo repo;
  late MockApiDataSource mockApiDataSource;

  setUp(() {
    mockApiDataSource = MockApiDataSource();
    repo = CatRepo(catDataSource: mockApiDataSource);
  });

  test('Should get cat fact from api', () async {
    final mockFact = CatFact("This is a test fact");
    when(mockApiDataSource.getCatFact())
        .thenAnswer((_) => Future.value(mockFact));
    final result = await repo.getFact();
    expect(result, mockFact);
    verify(mockApiDataSource.getCatFact()).called(1);
  });
  test('should handle empty response from API', () async {
    // Arrange
    when(mockApiDataSource.getCatFact()).thenAnswer((_) => Future.value([]));
    // Act
    final result = await repo.getFact();
    // Assert
    expect(result, isEmpty);
    verify(mockApiDataSource.getCatFact()).called(1);
  });

  test('should make multiple requests or calls', () {
    //Arrange
    when(mockApiDataSource.getCatFact())
        .thenAnswer((realInvocation) => Future.value());

    //Act
    repo.getFact();
    repo.getFact();
    repo.getFact();
    //Assert
    verify(mockApiDataSource.getCatFact()).called(3);
  });
}
