<h1>SUICIDE PILL & FAKE SUICIDE PILL</h1>

<h3>SUICIDE PILL</h3>
Allows players to use in-game item called <i>SUICIDE PILL</i> to kill themselfs therefore commit suicide. You can configure all the aspects of such event. 

Process:
<ol>
<li>Players uses the in-game item</li>
<li>Animation of eating the pill plays <b>(Which can be configured in config.lua)</b></li>
<li>After specified amount of time the pills kicks in and kills the player with screen event</li>
</ol>

<h3>FAKE SUICIDE PILL</h3>
Grants players ability to fake their own death. The process is same as in the SUICIDE PILL but the pill doesnt kill you. It fakes your death and leaves you lying on the ground for specific amount of time.


<h4>INSTALLATION</h4>
<ol>
<li>Download the newest version from github</li>
<li>Put it in the resources/[standalone]/</li>
<li>Add these items to your qbcore shared/items.lua</li>
<code>
['suicidepill'] = { ['name'] = 'suicidepill', ['label'] = 'Suicide pill', ['weight'] = 25, ['type'] = 'item', ['image'] = 'YOURPNGHERE.png', ['unique'] = true, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'When life hits the bottom :c' },
</code>
<hr>
<code>
['fakesuicidepill'] = { ['name'] = 'fakesuicidepill', ['label'] = 'Fake suicide pill', ['weight'] = 25, ['type'] = 'item', ['image'] = 'YOURPNGHERE.png', ['unique'] = true, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'A pill that could help you escape a ugly situation' },
</code>
<li>Configure the resource in config.lua</li>
<li><b>You are done :)</b></li>
</ol>

If you need more help contact me on discord -> IngPleb#0001
