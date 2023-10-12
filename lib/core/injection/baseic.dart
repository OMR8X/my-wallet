injectName() async {
  await injectDataSources();
  await injectRepositories();
  await injectUserCases();
}

Future<void> injectUserCases() async {}

Future<void> injectRepositories() async {}

Future<void> injectDataSources() async {}

Future<void> injectInstances() async {}
