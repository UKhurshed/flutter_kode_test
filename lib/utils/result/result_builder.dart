import 'package:flutter/material.dart';
import 'package:flutter_kode_test/utils/result/result.dart';


/// Класс для представления пользователю каких либо данных,
/// хранящихся в result. В большинстве случаев на весь проект достаточно иметь
/// только одну реализацию этого класса.
abstract class ResultBuilder<T> extends StatelessWidget {
  const ResultBuilder({
    super.key,
    required this.result,
    required this.successBuilder,
    this.errorBuilder,
    this.loadingBuilder,
    this.initialBuilder,
    this.emptyBuilder,
    this.onRetry,
  });

  /// Отображаемые данные.
  final Result<T> result;

  /// Callback для отображения успешно полученных данных.
  final Widget Function(BuildContext context, T data) successBuilder;

  /// Callback для отображения сообщения об ошибке. При null будет
  /// использоваться [defaultErrorBuilder].
  final Widget Function(
      BuildContext context,
      Exception exception,
      StackTrace? stackTrace,
      )? errorBuilder;

  /// Callback для отображения индикатора загрузки. При null будет
  /// использоваться [defaultLoadingBuilder].
  final WidgetBuilder? loadingBuilder;

  /// Callback для отображения изначального состояния. При null будет
  /// использоваться [loadingBuilder]. Если его значение тоже null,
  /// используется [defaultLoadingBuilder]. На практике этот параметр
  /// практически не приходится использовать.
  final WidgetBuilder? initialBuilder;

  /// Особый callback, который используется как альтернатива [successBuilder],
  /// если данные представляют из себя пустую коллекцию элементов. В ином
  /// случае значение этого параметра игнорируется.
  ///
  /// Если значение этого поля не задано, используется [successBuilder],
  /// но это поведение можно изменить, переопределив [defaultEmptyBuilder].
  final WidgetBuilder? emptyBuilder;

  /// Вспомогательный callback для попытки повторного получения данных.
  /// Сам по себе в этом классе он не используется, так что теоретически
  /// его можно использовать для любых целей, но лучше этого не делать.
  /// При необходимости в наследующем классе можно добавить любое число
  /// аналогичных параметров под конкретные нужды, а этот лучше оставить для
  /// использования в [errorBuilder] (или [defaultErrorBuilder]).
  ///
  /// Именно этот параметр было решено все-таки оставить в этом классе,
  /// потому что на практике его приходится использовать довольно часто. Также
  /// это может дополнительно мотивировать разработчика реализовывать подобную
  /// логику.
  final VoidCallback? onRetry;

  /// Используется для отображения стандартного индикатора загрузки,
  /// когда не указан [loadingBuilder].
  Widget defaultLoadingBuilder(BuildContext context);

  /// Используется для отображения стандартного сообщения об ошибке,
  /// когда не указан [errorBuilder]. Логика используемого виджета может
  /// различаться в зависимости от типа ошибки.
  ///
  /// Иногда может быть полезно дать пользователю возможность попытаться
  /// загрузить данные заново. Для этого можно использовать поле [onRetry].
  Widget defaultErrorBuilder(
      BuildContext context,
      Exception exception,
      StackTrace? stackTrace,
      );

  /// Используется для отображения пустого списка элементов, когда
  /// не указан [emptyBuilder]. Переопределять этот метод необязательно.
  /// По умолчанию будет использоваться [successBuilder].
  Widget defaultEmptyBuilder(BuildContext context) {
    return successBuilder(context, result.data as T);
  }

  @override
  Widget build(BuildContext context) {
    if (result.isSuccess) {
      final data = result.data;
      if (data is Iterable && data.isEmpty) {
        final builder = emptyBuilder ?? defaultEmptyBuilder;
        return builder(context);
      }
      return successBuilder(context, result.data as T);
    }
    if (result.isError) {
      final res = result as Error;
      final builder = errorBuilder ?? defaultErrorBuilder;
      return builder(context, res.exception, res.stackTrace);
    }
    if (result.isLoading) {
      final builder = loadingBuilder ?? defaultLoadingBuilder;
      return builder(context);
    }

    final builder = initialBuilder ?? loadingBuilder ?? defaultLoadingBuilder;
    return builder(context);
  }
}
