require 'open-uri'
require 'nokogiri'
require 'xmlsimple'
require 'minitest/autorun'

remote_base_url = "http://static.nvd.nist.gov/feeds/xml/cve/"
remote_page_name = "nvdcve-2.0-recent.xml"
remote_full_url = remote_base_url + "/" + remote_page_name

remote_data = open(remote_full_url).read
$static_cve = open("static_cve.xml", "w") 

$static_cve.write(remote_data)
$static_cve.close

$hash = XmlSimple.xml_in('static_cve.xml')


class Testjson < Minitest::Test
  def test_vul_config
    assert_equal "CVE-2013-7441", $hash['entry'][0]['id'], "ID: FALSE"
    print "CVE ID: #{$hash['entry'][0]['id']}\n"
    assert_equal "http://www.nist.gov/", $hash['entry'][0]['vulnerable-configuration'][0]['id'], "ID: FALSE"
    print "CVE ID: #{$hash['entry'][0]['vulnerable-configuration'][0]['id']}\n"
    assert_equal "OR", $hash['entry'][0]['vulnerable-configuration'][0]['logical-test'][0]['operator'], "Operator: FALSE"
    assert_equal "false",$hash['entry'][0]['vulnerable-configuration'][0]['logical-test'][0]['negate'], "Negate: FALSE"
    print "Running CVE ID: #{$hash['entry'][0]['id']} Fact-Ref\n"
    assert_equal "cpe:/a:wouter_verhelst:nbd:2.9.22",$hash['entry'][0]['vulnerable-configuration'][0]['logical-test'][0]['fact-ref'][0]['name'], "FACT-REF FALSE"
    assert_equal "cpe:/a:wouter_verhelst:nbd:2.9.23",$hash['entry'][0]['vulnerable-configuration'][0]['logical-test'][0]['fact-ref'][1]['name'], "FACT-REF FALSE"
    assert_equal "cpe:/a:wouter_verhelst:nbd:2.9.24",$hash['entry'][0]['vulnerable-configuration'][0]['logical-test'][0]['fact-ref'][2]['name'], "FACT-REF FALSE"
    assert_equal "cpe:/a:wouter_verhelst:nbd:2.9.25",$hash['entry'][0]['vulnerable-configuration'][0]['logical-test'][0]['fact-ref'][3]['name'], "FACT-REF FALSE"
    assert_equal "cpe:/a:wouter_verhelst:nbd:2.9.3",$hash['entry'][0]['vulnerable-configuration'][0]['logical-test'][0]['fact-ref'][4]['name'], "FACT-REF FALSE"
    assert_equal "cpe:/a:wouter_verhelst:nbd:2.9.4",$hash['entry'][0]['vulnerable-configuration'][0]['logical-test'][0]['fact-ref'][5]['name'], "FACT-REF FALSE"
    assert_equal "cpe:/a:wouter_verhelst:nbd:2.9.5",$hash['entry'][0]['vulnerable-configuration'][0]['logical-test'][0]['fact-ref'][6]['name'], "FACT-REF FALSE"
    assert_equal "cpe:/a:wouter_verhelst:nbd:2.9.6",$hash['entry'][0]['vulnerable-configuration'][0]['logical-test'][0]['fact-ref'][7]['name'], "FACT-REF FALSE"
    assert_equal "cpe:/a:wouter_verhelst:nbd:2.9.7",$hash['entry'][0]['vulnerable-configuration'][0]['logical-test'][0]['fact-ref'][8]['name'], "FACT-REF FALSE"
    assert_equal "cpe:/a:wouter_verhelst:nbd:2.9.8",$hash['entry'][0]['vulnerable-configuration'][0]['logical-test'][0]['fact-ref'][9]['name'], "FACT-REF FALSE"
    assert_equal "cpe:/a:wouter_verhelst:nbd:2.9.9",$hash['entry'][0]['vulnerable-configuration'][0]['logical-test'][0]['fact-ref'][10]['name'], "FACT-REF FALSE"
    assert_equal "cpe:/a:wouter_verhelst:nbd:3.0",$hash['entry'][0]['vulnerable-configuration'][0]['logical-test'][0]['fact-ref'][11]['name'], "FACT-REF FALSE"
    assert_equal "cpe:/a:wouter_verhelst:nbd:3.1",$hash['entry'][0]['vulnerable-configuration'][0]['logical-test'][0]['fact-ref'][12]['name'], "FACT-REF FALSE"
    assert_equal "cpe:/a:wouter_verhelst:nbd:3.1.1",$hash['entry'][0]['vulnerable-configuration'][0]['logical-test'][0]['fact-ref'][13]['name'], "FACT-REF FALSE"
    assert_equal "cpe:/a:wouter_verhelst:nbd:3.2",$hash['entry'][0]['vulnerable-configuration'][0]['logical-test'][0]['fact-ref'][14]['name'], "FACT-REF FALSE"
    assert_equal "cpe:/a:wouter_verhelst:nbd:3.3",$hash['entry'][0]['vulnerable-configuration'][0]['logical-test'][0]['fact-ref'][15]['name'], "FACT-REF FALSE"
  end
  
  def test_vul_soft_list
    print "Running CVE ID: #{$hash['entry'][0]['id']} Product\n"
    assert_equal "cpe:/a:wouter_verhelst:nbd:3.1.1",$hash['entry'][0]['vulnerable-software-list'][0]['product'][0], "Produce: False"
    assert_equal "cpe:/a:wouter_verhelst:nbd:2.9.9",$hash['entry'][0]['vulnerable-software-list'][0]['product'][1], "Produce: False"
    assert_equal "cpe:/a:wouter_verhelst:nbd:2.9.25",$hash['entry'][0]['vulnerable-software-list'][0]['product'][2], "Produce: False"
    assert_equal "cpe:/a:wouter_verhelst:nbd:2.9.23",$hash['entry'][0]['vulnerable-software-list'][0]['product'][3], "Produce: False"
    assert_equal "cpe:/a:wouter_verhelst:nbd:2.9.24",$hash['entry'][0]['vulnerable-software-list'][0]['product'][4], "Produce: False"
    assert_equal "cpe:/a:wouter_verhelst:nbd:3.0",$hash['entry'][0]['vulnerable-software-list'][0]['product'][5], "Produce: False"
    assert_equal "cpe:/a:wouter_verhelst:nbd:2.9.22",$hash['entry'][0]['vulnerable-software-list'][0]['product'][6], "Produce: False"
    assert_equal "cpe:/a:wouter_verhelst:nbd:3.2",$hash['entry'][0]['vulnerable-software-list'][0]['product'][7], "Produce: False"
    assert_equal "cpe:/a:wouter_verhelst:nbd:3.1",$hash['entry'][0]['vulnerable-software-list'][0]['product'][8], "Produce: False"
    assert_equal "cpe:/a:wouter_verhelst:nbd:2.9.8",$hash['entry'][0]['vulnerable-software-list'][0]['product'][9], "Produce: False"
    assert_equal "cpe:/a:wouter_verhelst:nbd:2.9.7",$hash['entry'][0]['vulnerable-software-list'][0]['product'][10], "Produce: False"
    assert_equal "cpe:/a:wouter_verhelst:nbd:2.9.4",$hash['entry'][0]['vulnerable-software-list'][0]['product'][11], "Produce: False"
    assert_equal "cpe:/a:wouter_verhelst:nbd:2.9.3",$hash['entry'][0]['vulnerable-software-list'][0]['product'][12], "Produce: False"
    assert_equal "cpe:/a:wouter_verhelst:nbd:2.9.6",$hash['entry'][0]['vulnerable-software-list'][0]['product'][13], "Produce: False"
    assert_equal "cpe:/a:wouter_verhelst:nbd:2.9.5",$hash['entry'][0]['vulnerable-software-list'][0]['product'][14], "Produce: False"
    assert_equal "cpe:/a:wouter_verhelst:nbd:3.3",$hash['entry'][0]['vulnerable-software-list'][0]['product'][15], "Produce: False"
  end
  
  def test_cvss
    print "Running CVE ID: #{$hash['entry'][0]['id']} Base Metrics\n"
    assert_equal '7.8', $hash['entry'][0]['cvss'][0]['base_metrics'][0]['score'][0], "Score: Fail"
    assert_equal 'NETWORK', $hash['entry'][0]['cvss'][0]['base_metrics'][0]['access-vector'][0], "Access-Vector: Fail"
    assert_equal 'LOW', $hash['entry'][0]['cvss'][0]['base_metrics'][0]['access-complexity'][0], "Complexity: Fail"
    assert_equal 'NONE', $hash['entry'][0]['cvss'][0]['base_metrics'][0]['authentication'][0], "Authentication: Fail"
    assert_equal 'NONE', $hash['entry'][0]['cvss'][0]['base_metrics'][0]['confidentiality-impact'][0], "Conf Impact: Fail"
    assert_equal 'NONE', $hash['entry'][0]['cvss'][0]['base_metrics'][0]['integrity-impact'][0], "Int Impact: Fail"
    assert_equal 'COMPLETE', $hash['entry'][0]['cvss'][0]['base_metrics'][0]['availability-impact'][0], "Avail Impact: Fail"
    assert_equal 'http://nvd.nist.gov', $hash['entry'][0]['cvss'][0]['base_metrics'][0]['source'][0], "Source: Fail"
    assert_equal '2015-06-01T12:55:30.693-04:00', $hash['entry'][0]['cvss'][0]['base_metrics'][0]['generated-on-datetime'][0], "Date: Fail"
  end
  
  def test_cwe
    print "Running CVE ID: #{$hash['entry'][0]['id']} CWE\n"
    assert_equal 'CWE-399', $hash['entry'][0]['cwe'][0]['id'], "CWE: Fail"
  end
  
  def test_ref0
    print "Running CVE ID: #{$hash['entry'][0]['id']} References\n"
    assert_equal 'en', $hash['entry'][0]['references'][0]["xml:lang"], "XML Lang: Fail"
    assert_equal 'UNKNOWN', $hash['entry'][0]['references'][0]["reference_type"], "Type: Fail"
    assert_equal 'CONFIRM', $hash['entry'][0]['references'][0]["source"][0], "Source: Fail"
    assert_equal 'https://github.com/yoe/nbd/commit/741495cb08503fd32a9d22648e63b64390c601f4', $hash['entry'][0]['references'][0]['reference'][0]['href'], "HREF: Fail"
    assert_equal 'https://github.com/yoe/nbd/commit/741495cb08503fd32a9d22648e63b64390c601f4', $hash['entry'][0]['references'][0]['reference'][0]['content'], "Content: Fail"
  end
  
  def test_ref1
    print "Running CVE ID: #{$hash['entry'][0]['id']} References\n"
    assert_equal 'en', $hash['entry'][0]['references'][1]["xml:lang"], "XML Lang: Fail"
    assert_equal 'UNKNOWN', $hash['entry'][0]['references'][1]["reference_type"], "Type: Fail"
    assert_equal 'CONFIRM', $hash['entry'][0]['references'][1]["source"][0], "Source: Fail"
    assert_equal 'https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=781547', $hash['entry'][0]['references'][1]['reference'][0]['href'], "HREF: Fail"
    assert_equal 'https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=781547', $hash['entry'][0]['references'][1]['reference'][0]['content'], "Content: Fail"
  end
  
  def test_ref2
    print "Running CVE ID: #{$hash['entry'][0]['id']} References\n"
    assert_equal 'en', $hash['entry'][0]['references'][2]["xml:lang"], "XML Lang: Fail"
    assert_equal 'UNKNOWN', $hash['entry'][0]['references'][2]["reference_type"], "Type: Fail"
    assert_equal 'MLIST', $hash['entry'][0]['references'][2]["source"][0], "Source: Fail"
    assert_equal 'http://www.openwall.com/lists/oss-security/2015/05/21/5', $hash['entry'][0]['references'][2]['reference'][0]['href'], "HREF: Fail"
    assert_equal '[oss-security] 20150521 Re: CVE Request: nbd denial of service', $hash['entry'][0]['references'][2]['reference'][0]['content'], "Content: Fail"
  end
  
  def test_ref3
    print "Running CVE ID: #{$hash['entry'][0]['id']} References\n"
    assert_equal 'en', $hash['entry'][0]['references'][3]["xml:lang"], "XML Lang: Fail"
    assert_equal 'UNKNOWN', $hash['entry'][0]['references'][3]["reference_type"], "Type: Fail"
    assert_equal 'MLIST', $hash['entry'][0]['references'][3]["source"][0], "Source: Fail"
    assert_equal 'http://www.openwall.com/lists/oss-security/2015/05/19/6', $hash['entry'][0]['references'][3]['reference'][0]['href'], "HREF: Fail"
    assert_equal '[oss-security] 20150519 CVE Request: nbd denial of service', $hash['entry'][0]['references'][3]['reference'][0]['content'], "Content: Fail"
  end
  
  def test_ref4
    print "Running CVE ID: #{$hash['entry'][0]['id']} References\n"
    assert_equal 'en', $hash['entry'][0]['references'][4]["xml:lang"], "XML Lang: Fail"
    assert_equal 'UNKNOWN', $hash['entry'][0]['references'][4]["reference_type"], "Type: Fail"
    assert_equal 'DEBIAN', $hash['entry'][0]['references'][4]["source"][0], "Source: Fail"
    assert_equal 'http://www.debian.org/security/2015/dsa-3271', $hash['entry'][0]['references'][4]['reference'][0]['href'], "HREF: Fail"
    assert_equal 'DSA-3271', $hash['entry'][0]['references'][4]['reference'][0]['content'], "Content: Fail"
  end
  
  def test_ref5
    print "Running CVE ID: #{$hash['entry'][0]['id']} References\n"
    assert_equal 'en', $hash['entry'][0]['references'][5]["xml:lang"], "XML Lang: Fail"
    assert_equal 'UNKNOWN', $hash['entry'][0]['references'][5]["reference_type"], "Type: Fail"
    assert_equal 'MLIST', $hash['entry'][0]['references'][5]["source"][0], "Source: Fail"
    assert_equal 'http://sourceforge.net/p/nbd/mailman/message/30410146/', $hash['entry'][0]['references'][5]['reference'][0]['href'], "HREF: Fail"
    assert_equal '[Nbd] 20130128 NBD server terminates on SIGPIPE during negotiation', $hash['entry'][0]['references'][5]['reference'][0]['content'], "Content: Fail"
  end
end
