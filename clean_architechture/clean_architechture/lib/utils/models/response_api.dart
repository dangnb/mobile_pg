
class ResponseApi<E>{
  final bool status;
  final String? description;
  final E? body;
  ResponseApi({required  this.status,required this.description,required this.body});
}