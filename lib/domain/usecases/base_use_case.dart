/*
 * cocktail_app
 * base_use_case
 * Created by Bahri Rizaldi on 04/06/2020 9:05
 *
 */

abstract class BaseUseCase<TResult, TParams> {
  Future<TResult> execute(TParams params);
}

class UseCaseResult {
  final Exception exception;
  final bool result;

  UseCaseResult({
    this.exception,
    this.result
  });

  bool get validResults => exception == null;
}