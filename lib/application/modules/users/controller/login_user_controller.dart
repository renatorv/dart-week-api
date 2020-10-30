import 'package:injectable/injectable.dart';
import 'package:pizza_delivery_api/application/exceptions/user_notfound_exception.dart';
import 'package:pizza_delivery_api/application/modules/users/controller/models/login_user_rq.dart';
import 'package:pizza_delivery_api/application/modules/users/service/i_user_service.dart';

import '../../../../pizza_delivery_api.dart';

@Injectable()
class LoginUserController extends ResourceController {
  final IUserService _service;

  LoginUserController(this._service);

  @Operation.post()
  Future<Response> login(@Bind.body() LoginUserRq requestLogin) async {
    try {
      final user =
          await _service.login(requestLogin.email, requestLogin.password);
      // no retorno quando está tudo OK, poderia utilizar o retorno abaixo:
      // return Response.ok(user.toJson());
      // porem aqui ira devolver tb o password, o que nao é legal,
      // assim utilizou-se o retorno abaixo:
      return Response.ok({
        'id': user.id,
        'name': user.name,
        'email': user.email,
      });
    } on UserNotfoundException catch (e) {
      print(e);
      return Response.forbidden();
    } catch (e) {
      return Response.serverError(body: {'message': 'Internal server error'});
    }
  }
}
