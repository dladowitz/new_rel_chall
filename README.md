# Events Service API

## Create events
url: /orgs/:org_id/events/string={your comments here}
url: /orgs/1/events/string=helloworld

Note that the hostname and timestamp that is calling the API will be automatically recorded with the event


## Show events
Queries events for an org

#### Default give back last 10 events for an org
url: /orgs/:org_id/events/
<br>
<br>

#### Allow user is specify how many events the want back
url: /orgs/:org_id/events/number={number of events}<br>
ex: /orgs/:org_id/events/number=25
<br>
<br>

#### Allow user is get events in reverse chronological order
url: /orgs/:org_id/events/reverse=true<br>
ex: /orgs/:org_id/events/reverse=true
<br>
<br>
#### Allow user to limit events to a specific hostname
url: /orgs/:org_id/events/hostname={your hostname}<br>
ex: /orgs/:org_id/events/hostname=newrelic.com
<br>
<br>
#### Query strings can be combined
url: /orgs/:org_id/events/hostname=newrelic.com&number=15&reverse=true<br>
