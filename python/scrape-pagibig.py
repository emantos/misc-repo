import requests
import json
from bs4 import BeautifulSoup

page = requests.get('http://pagibigfund.gov.ph/dlformshousing.html')

soup = BeautifulSoup(page.text, 'html.parser')

docus = []
currentClassification = "";
for row in soup.find_all('tr'):
    for content in row.contents:
        if content.name == 'th' and hasattr(content, 'strong') and content.strong != None:
            currentClassification = content.strong.text.encode('ascii', errors='replace').decode().strip();

        if content.name == 'th' and 'scope' in content.attrs and content.attrs['scope'] == 'row':
            docu = {}
            docu['description'] = content.text.encode('ascii', errors='replace').decode()
            for sibling in content.next_siblings:
                if sibling.name == 'td':
                    if len(sibling.text.encode('ascii', errors='replace').decode().strip()) != 0:
                        text = sibling.text.strip()
                        if text.startswith('V'):
                            docu['version'] = text
                        else:
                            if 'documentNumber' not in docu:
                                docu['documentNumber'] = text
                            else:
                                docu['fillableLink'] = text
                    if hasattr(sibling, 'a') and sibling.a != None:
                        docu['downloadableLink'] = sibling.a['href']
            docu['agency'] = 'PAG-IBIG'
            docu['classification'] = ['Housing Related Forms', currentClassification]
            docus.append(docu)

print(json.dumps(docus, sort_keys=True, indent=4))
