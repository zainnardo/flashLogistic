///TODO: Constant For Additional Versioning and Responses from server
///
const int TIMEOUT_CONNECT   = 25000;//15000;
const int TIMEOUT_RECEIVE   = 25000;//15000;
//NOTE: const - Response Message
const String ERR_MSG_TIMEOUT = 'Connection timed out';
const String ERR_MSG_GENERIC = 'System mengalami kendala. '
                               'Mohon untuk mencoba kembali beberapa saat lagi. ';
const String ERR_MSG_SOCKET  = 'Jaringan internet bermasalah. '
                               'Mohon untuk mencoba kembali beberapa saat lagi. ';


//NOTE: const - Response Code
const String RC_SUCCESS           = '00';
const String RC_GENERAL_ERROR     = '99';
const String RC_GENERAL_EXCEPTION = 'exc';
const String RC_TX_ADVICE_TIMEOUT = 'excTimeOut';
