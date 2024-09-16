
import 'package:real_estate/features/Realestate/data/models/realestate.dart';
import 'package:real_estate/features/Realestate/data/repoistory/realestate_repo.dart';

import '../../../../core/params/base_params.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecase/usecase.dart';


class GetOneRealestateParams extends BaseParams {
 final int chickenId;
  GetOneRealestateParams({required this.chickenId});

}

class GetOneReatestateUseCase extends UseCase<RealestateModel,GetOneRealestateParams> {
  final RealestateRepository repository;

  GetOneReatestateUseCase(this.repository);

  @override
  Future<Result<RealestateModel>> call({required GetOneRealestateParams params}) {
    return repository.getOneChicken(params: params);
  }
}
