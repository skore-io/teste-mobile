abstract class BaseError extends Error {
  String message;

  BaseError({
    this.message = 'Ops... Tente novamente ;)',
  });
}
