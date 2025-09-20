import 'package:pusoo/core/utils/usecase.dart';
import 'package:pusoo/features/source/domain/entities/source.dart';
import 'package:pusoo/features/source/presentation/providers/source_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'active_source_notifier.g.dart';

@Riverpod(keepAlive: true)
class ActiveSourceNotifier extends _$ActiveSourceNotifier {
  // Metode build ini akan dipanggil pertama kali oleh Riverpod
  @override
  AsyncValue<Source?> build() {
    return const AsyncValue.loading();
  }

  Future<void> perform() async {
    state = AsyncValue.loading();

    final result = await ref
        .read(getActiveSourceUsecaseProvider)
        .call(NoParams());

    result.fold(
      (failure) {
        state = AsyncValue.error(failure, StackTrace.current);
      },
      (data) {
        state = AsyncValue.data(data);
      },
    );
  }
}
