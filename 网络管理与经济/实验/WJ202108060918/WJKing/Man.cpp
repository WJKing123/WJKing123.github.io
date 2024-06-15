#include "iostream"
#include "snmp_pp/snmp_pp.h"
#include <string>
#include <cstdlib> // 用于 atoi 等函数
using namespace std;

void performGet(const string& ip, const string& community, const string& oidStr) {
    // 与原queryInfo函数相似，但专注于GET操作
    Snmp::socket_startup();
    int status;
    Oid oid(oidStr.c_str());
    Vb vb(oid);

    Pdu pdu;
    pdu += vb;

    string udpAddress = ip;
    UdpAddress udp(udpAddress.c_str());
    CTarget ctarget(udp);
    snmp_version version = version1;
    ctarget.set_version(version);
    ctarget.set_readcommunity(community.c_str());

    Snmp snmp(status, 0, false);
    if (status != SNMP_CLASS_SUCCESS) {
        cout << snmp.error_msg(status);
        return;
    }

    if ((status = snmp.get(pdu, ctarget)) != SNMP_CLASS_SUCCESS) {
        cout << snmp.error_msg(status);
    } else {
        pdu.get_vb(vb, 0);
        cout << "Value for OID " << oidStr << " = " << vb.get_printable_value() << endl;
    }

    Snmp::socket_cleanup();
}

void performGetNext(const string& ip, const string& community, const string& oidStr) {
    Snmp::socket_startup();
    int status;
    Oid oid(oidStr.c_str());
    Vb vb(oid);

    Pdu pdu;
    pdu += vb;

    string udpAddress = ip;
    UdpAddress udp(udpAddress.c_str());
    CTarget ctarget(udp);
    snmp_version version = version1;
    ctarget.set_version(version);
    ctarget.set_readcommunity(community.c_str());

    Snmp snmp(status, 0, false);
    if (status != SNMP_CLASS_SUCCESS) {
        cout << snmp.error_msg(status);
        return;
    }

    if ((status = snmp.get_next(pdu, ctarget)) != SNMP_CLASS_SUCCESS) {
        cout << snmp.error_msg(status);
    } else {
        pdu.get_vb(vb, 0);
        cout << "Value for OID " << oidStr << " = " << vb.get_printable_value() << endl;
    }

    Snmp::socket_cleanup();
}

void performSet(const string& ip, const string& community, const string& oidStr, const string& setValue) {
    Snmp::socket_startup();
    int status;
    Oid oid(oidStr.c_str());
    
    // 创建Vb实例
    Vb vb;
    
    // 设置OID
    vb.set_oid(oid);
    
    // 将字符串值转换为OctetStr对象并设置Vb的值
    OctetStr osSetValue(setValue.c_str());
    vb.set_value(osSetValue);

    Pdu pdu;
    pdu += vb; // 将Vb对象添加到Pdu对象中

    string udpAddress = ip;
    UdpAddress udp(udpAddress.c_str());
    CTarget ctarget(udp);
    snmp_version version = version1;
    ctarget.set_version(version);
    ctarget.set_writecommunity(community.c_str());

    Snmp snmp(status, 0, false);
    if (status != SNMP_CLASS_SUCCESS) {
        cout << snmp.error_msg(status);
        return;
    }

    if ((status = snmp.set(pdu, ctarget)) != SNMP_CLASS_SUCCESS) {
        cout << snmp.error_msg(status);
    } else {
        cout << "SET operation on OID " << oidStr << " successful." << endl;
    }

    Snmp::socket_cleanup();
}

int main(int argc, char* argv[]) {
    if(argc < 5 || argc > 6) {
        cout << "Usage: " << argv[0] << " [get|getnext|set] <IP> <Community> <OID> [ValueToSet]\n";
        return 1;
    }

    string operation = argv[1];
    string ip = argv[2];
    string community = argv[3];
    string oidStr = argv[4];
    string setValue; // 仅SET操作需要

    if(argc == 6) {
        setValue = argv[5]; // 获取设置的值
    }

    if(operation == "get") {
        performGet(ip, community, oidStr);
    } else if(operation == "getnext") {
        performGetNext(ip, community, oidStr);
    } else if(operation == "set") {
        if(setValue.empty()) {
            cout << "SET operation requires a value to set.\n";
            return 1;
        }
        performSet(ip, community, oidStr, setValue);
    } else {
        cout << "Unsupported operation: " << operation << ". Use 'get', 'getnext', or 'set'.\n";
        return 1;
    }

    return 0;
}