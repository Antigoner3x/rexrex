require 'json'
require 'minitest/autorun'
#require './testme'

$file_name = '/Users/stephanielauk/Desktop/wordpress-debian-based-linux-v1.fim.json'
file = File.read($file_name)
$data_hash = JSON.parse(file)

class Testjson < Minitest::Test
  def test_null
    print "Verifying #{File.basename($file_name)} not Null.\n"
    refute_empty $data_hash, "FILE NULL"
    print "Testing #{$data_hash['fim_policy']["name"]}\n"
  end
  
  def test_os
    print "Verifying OS: \n"
    if assert_equal "linux", $data_hash['fim_policy']["platform"]
      print "platform: Linux\n"
    elsif assert_equal "windows", $data_hash['fim_policy']["platform"]
      print "platform: Windows\n"
    else assert_raises(NoMethodError)
    end
  end
  
  def test_rules0
    #print "#{$data_hash['fim_policy']['rules'][0]['target']}\n"
    assert_equal "/etc/wordpress", $data_hash['fim_policy']['rules'][0]['target'], "target: Unequal"
    print "Target: #{File.basename($data_hash['fim_policy']['rules'][0]['target'])}\n"
    assert $data_hash['fim_policy']["rules"][0]["recurse"], "recurse: false"
    assert $data_hash['fim_policy']["rules"][0]["critical"], "critical: false"
    assert $data_hash['fim_policy']["rules"][0]["alert"], "alert: false"
    refute $data_hash['fim_policy']["rules"][0]["prelink"], "prelink: true"
  end
  
  def test_rules1
    #print "#{$data_hash['fim_policy']['rules'][0]['target']}\n"
    assert_equal "/var/www/wp-admin", $data_hash['fim_policy']['rules'][1]['target'], "target: Unequal"
    print "Target: #{File.basename($data_hash['fim_policy']['rules'][1]['target'])}\n"
    refute $data_hash['fim_policy']["rules"][1]["recurse"], "recurse: true"
    assert $data_hash['fim_policy']["rules"][1]["critical"], "critical: false"
    assert $data_hash['fim_policy']["rules"][1]["alert"], "alert: false"
    refute $data_hash['fim_policy']["rules"][1]["prelink"], "prelink: true"
  end
  def test_rules2
    #print "#{$data_hash['fim_policy']['rules'][0]['target']}\n"
    assert_equal "/var/www/wp-admin/images", $data_hash['fim_policy']['rules'][2]['target'], "target: Unequal"
    print "Target: #{File.basename($data_hash['fim_policy']['rules'][2]['target'])}\n"
    assert $data_hash['fim_policy']["rules"][2]["recurse"], "recurse: false"
    assert $data_hash['fim_policy']["rules"][2]["critical"], "critical: false"
    assert $data_hash['fim_policy']["rules"][2]["alert"], "alert: false"
    refute $data_hash['fim_policy']["rules"][2]["prelink"], "prelink: true"
  end
  
  def test_rules3
    #print "#{$data_hash['fim_policy']['rules'][0]['target']}\n"
    assert_equal "/var/www/wp-admin/images/screenshots", $data_hash['fim_policy']['rules'][3]['target'], "target: Unequal"
    print "Target: #{File.basename($data_hash['fim_policy']['rules'][3]['target'])}\n"
    assert $data_hash['fim_policy']["rules"][3]["recurse"], "recurse: false"
    assert $data_hash['fim_policy']["rules"][3]["critical"], "critical: false"
    assert $data_hash['fim_policy']["rules"][3]["alert"], "alert: false"
    refute $data_hash['fim_policy']["rules"][3]["prelink"], "prelink: true"
  end
  
  def test_rules4
    #print "#{$data_hash['fim_policy']['rules'][0]['target']}\n"
    assert_equal "/var/www/wp-admin/includes", $data_hash['fim_policy']['rules'][4]['target'], "target: Unequal"
    print "Target: #{File.basename($data_hash['fim_policy']['rules'][4]['target'])}\n"
    assert $data_hash['fim_policy']["rules"][4]["recurse"], "recurse: false"
    assert $data_hash['fim_policy']["rules"][4]["critical"], "critical: false"
    assert $data_hash['fim_policy']["rules"][4]["alert"], "alert: false"
    refute $data_hash['fim_policy']["rules"][4]["prelink"], "prelink: true"
  end
  
    def test_rules5
    #print "#{$data_hash['fim_policy']['rules'][0]['target']}\n"
    assert_equal "/var/www/wp-admin/maint", $data_hash['fim_policy']['rules'][5]['target'], "target: Unequal"
    print "Target: #{File.basename($data_hash['fim_policy']['rules'][5]['target'])}\n"
    assert $data_hash['fim_policy']["rules"][5]["recurse"], "recurse: false"
    assert $data_hash['fim_policy']["rules"][5]["critical"], "critical: false"
    assert $data_hash['fim_policy']["rules"][5]["alert"], "alert: false"
    refute $data_hash['fim_policy']["rules"][5]["prelink"], "prelink: true"
  end
  
    def test_rules6
    #print "#{$data_hash['fim_policy']['rules'][0]['target']}\n"
    assert_equal "/var/www/wp-admin/network", $data_hash['fim_policy']['rules'][6]['target'], "target: Unequal"
    print "Target: #{File.basename($data_hash['fim_policy']['rules'][6]['target'])}\n"
    assert $data_hash['fim_policy']["rules"][6]["recurse"], "recurse: false"
    assert $data_hash['fim_policy']["rules"][6]["critical"], "critical: false"
    assert $data_hash['fim_policy']["rules"][6]["alert"], "alert: false"
    refute $data_hash['fim_policy']["rules"][6]["prelink"], "prelink: true"
  end
  
    def test_rules7
    #print "#{$data_hash['fim_policy']['rules'][0]['target']}\n"
    assert_equal "/var/www/wp-admin/user", $data_hash['fim_policy']['rules'][7]['target'], "target: Unequal"
    print "Target: #{File.basename($data_hash['fim_policy']['rules'][7]['target'])}\n"
    assert $data_hash['fim_policy']["rules"][7]["recurse"], "recurse: false"
    assert $data_hash['fim_policy']["rules"][7]["critical"], "critical: false"
    assert $data_hash['fim_policy']["rules"][7]["alert"], "alert: false"
    refute $data_hash['fim_policy']["rules"][7]["prelink"], "prelink: true"
  end
  
    def test_rules8
    #print "#{$data_hash['fim_policy']['rules'][0]['target']}\n"
    assert_equal "/var/www/wp-content", $data_hash['fim_policy']['rules'][8]['target'], "target: Unequal"
    print "Target: #{File.basename($data_hash['fim_policy']['rules'][8]['target'])}\n"
    refute $data_hash['fim_policy']["rules"][8]["recurse"], "recurse: true"
    assert $data_hash['fim_policy']["rules"][8]["critical"], "critical: false"
    assert $data_hash['fim_policy']["rules"][8]["alert"], "alert: false"
    refute $data_hash['fim_policy']["rules"][8]["prelink"], "prelink: true"
  end
  
  def test_rules9
    #print "#{$data_hash['fim_policy']['rules'][0]['target']}\n"
    assert_equal "/var/www/wp-content/languages", $data_hash['fim_policy']['rules'][9]['target'], "target: Unequal"
    print "Target: #{File.basename($data_hash['fim_policy']['rules'][9]['target'])}\n"
    assert $data_hash['fim_policy']["rules"][9]["recurse"], "recurse: false"
    assert $data_hash['fim_policy']["rules"][9]["critical"], "critical: false"
    assert $data_hash['fim_policy']["rules"][9]["alert"], "alert: false"
    refute $data_hash['fim_policy']["rules"][9]["prelink"], "prelink: true"
  end
  
  def test_rules10
    #print "#{$data_hash['fim_policy']['rules'][0]['target']}\n"
    assert_equal "/var/www/wp-content/plugins", $data_hash['fim_policy']['rules'][10]['target'], "target: Unequal"
    print "Target: #{File.basename($data_hash['fim_policy']['rules'][10]['target'])}\n"
    assert $data_hash['fim_policy']["rules"][10]["recurse"], "recurse: false"
    assert $data_hash['fim_policy']["rules"][10]["critical"], "critical: false"
    assert $data_hash['fim_policy']["rules"][10]["alert"], "alert: false"
    refute $data_hash['fim_policy']["rules"][10]["prelink"], "prelink: true"
  end
  
 def test_rules11
    #print "#{$data_hash['fim_policy']['rules'][0]['target']}\n"
    assert_equal "/var/www/wp-content/themes", $data_hash['fim_policy']['rules'][11]['target'], "target: Unequal"
    print "Target: #{File.basename($data_hash['fim_policy']['rules'][11]['target'])}\n"
    assert $data_hash['fim_policy']["rules"][11]["recurse"], "recurse: false"
    assert $data_hash['fim_policy']["rules"][11]["critical"], "critical: false"
    assert $data_hash['fim_policy']["rules"][11]["alert"], "alert: false"
    refute $data_hash['fim_policy']["rules"][11]["prelink"], "prelink: true"
  end
  
 def test_rules12
    #print "#{$data_hash['fim_policy']['rules'][0]['target']}\n"
    assert_equal "/var/www/wp-includes", $data_hash['fim_policy']['rules'][12]['target'], "target: Unequal"
    print "Target: #{File.basename($data_hash['fim_policy']['rules'][12]['target'])}\n"
    assert $data_hash['fim_policy']["rules"][12]["recurse"], "recurse: false"
    assert $data_hash['fim_policy']["rules"][12]["critical"], "critical: false"
    assert $data_hash['fim_policy']["rules"][12]["alert"], "alert: false"
    refute $data_hash['fim_policy']["rules"][12]["prelink"], "prelink: true"
  end
end

