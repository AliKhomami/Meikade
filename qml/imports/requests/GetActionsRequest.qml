import QtQuick 2.0
import AsemanQml.Base 2.0
import globals 1.0

BaseRequest {
    id: actionsRequest
    url: baseUrl + "/user/sync"

    property string date
}
