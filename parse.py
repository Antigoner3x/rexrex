import json


jsondata = r'C:\Users\steph\Documents\json\x00report.json'

data_s = [] #to string
data_o = [] #to object

class openJson(object):
    
    def __init__(self):
        print "Parsing Json"
    
    def open(self):


        with open(jsondata) as json_data:
            for line in json_data:
                data_s.append(json.dumps(line))
                data_o.append(json.loads(line))
            
        #print data_o[0]
        
        print "Hidden Services:\n        ", data_o[0]["hiddenService"], "\n"
        print "Performed Scans:\n        ", data_o[0]["performedScans"], "\n"
        print "Simple Report:\n        ", data_o[0]["simpleReport"]['risks'], "\n"
        print "Crawls:\n        ", data_o[0]["crawls"]["http://0-0helix.grams7enekj3fhxz.onion/"], "\n"
        print "Date Scanned:\n        ", data_o[0]["dateScanned"], "\n"
        print "Identifier Report: Linked Onions:\n        ", data_o[0]["identifierReport"]["linkedOnions"], "\n"
    
        return data_s, data_o


    
if __name__ == '__main__':
    openJson().open()
