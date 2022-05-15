//Definir les Evenements a traiter
abstract class ContactEvent{}

//Les evenements qui vont etre envoyer dans un Stream vers BLOC
class LoadAllContactsEvent extends ContactEvent{}
class LoadBDCCContactsEvent extends ContactEvent{}
class LoadGLSIDContactsEvent extends ContactEvent{}



