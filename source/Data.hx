import flixel.FlxSprite;
import flixel.FlxG;

class Data {
	public static var events = [
		{"choices":[{text:"The president just announced state of emergency across country due to recent demonstrations.",reaction:"0"},
		{text:"Please get rid of those savage protesters. we can't walk safely any more",reaction:"+10"},
		{text:"Our Dictator just announced some new rules .. like his cops are not powerful enough already ",reaction:"-5"},
		{text:"If you have nothing to hide, you have nothing to fear.",reaction:"+2"}]
		},
		{"choices":[{text:"A huge ship just sank and all passenger froze in the sea and rescue boats were too late",reaction:"0"},
		{text:"It’s just an accident. It happens all over the world.",reaction:"+7"},
		{text:"There needs to be some serious investigations about this.",reaction:"+2"},
		{text:"The transportation minister should be submitted to trials",reaction:"-5"}]
		},
		{"choices":[{text:"Many of the biggest national companies were sold to the private sector . And thousands of employees got laid off.",reaction:"0"},
		{text:"This is to encourage foreign investment.",reaction:"+5"},
		{text:"We should enforce laws to protect the people.",reaction:"-4"},
		{text:"Only lazy employees were fired. If you don’t want to get fired, work hard",reaction:"+3"}]
		},
		{"choices":[{text:"A 200 Km piece of ground has been sold to the multimillionaire for dirt cheap",reaction:"0"},
		{text:"Reclamation is better than leaving it like that",reaction:"+4"},
		{text:"Stop selling our land like you own it",reaction:"-5"},
		{text:"It will provide a lot of job opportunities",reaction:"+6"}]
		},
		{"choices":[{text:"Reports indicate that the president is preparing his son to be the next heir",reaction:"0"},
		{text:"Who is better to rule this country than this man.it’s like they say 'like father like son'",reaction:"+5"},
		{text:"Is this a joke. Like one of them is not enough already",reaction:"-6"},
		{text:"Let’s wait and see .. give him a chance",reaction:"+3"}]
		},
		{"choices":[{text:"3 murders of tortures happened this week in police stations. And many more unannounced cases.",reaction:"0"},
		{text:"No Human deserves this treatment. This is outrageous.",reaction:"-7"},
		{text:"It’s just some individual incidents. I am sure it wasn’t on purpose.",reaction:"+4"},
		{text:"This is all for the good of the society. We need people to be afraid of committing crimes",reaction:"+8"}]
		},	
		{"choices":[{text:"the president's party just won the elections by 97%",reaction:"0"},
		{text:"They say the seventh time's  the charm .. I am sure they will succeed this time",reaction:"+3"},
		{text:"This is a proof of the mutual trust between the government and the people.",reaction:"+8"},
		{text:"This is the result of them shutting up all opposing opinions. How could a healthy regime be that one sided.",reaction:"-5"}]
		},
		{"choices":[{text:"After spending billions in this project. It barely even covered its costs.",reaction:"+5"},
		{text:"We have to wait 10 more years. Big projects like this needs years and years to make profit.",reaction:"+5"},
		{text:"Dozens of experts said that this projects is not worth it. It was all just for show. ",reaction:"+5"},
		{text:"Those who say that the project was a failure are the failures. They are all just jealous and envious of its success.",reaction:"+5"}]
		},
		{"choices":[{"text":"#20% of the people are illiterate. Due to bad educational facilities. ",reaction:"+5"},
		{"text":"#Those illiterates are what’s keeping this regime in place. That’s why he is not doing anything about it.",reaction:"+5"},
		{"text":"#The Government already started to fix this. Literacy will disappear in no less than 50 years .. hopefully ",reaction:"+5"},
		{"text":"#These statistics are wrong .. they exaggerate just to make the government look bad.",reaction:"+5"}]
		},
		{"choices":[{"text":"#In the last statistics we got the first place in number of hepatitis C.",reaction:"+5"},
		{"text":"#At Least we are got the first place. ",reaction:"+5"},
		{"text":"#It’s not the government’s fault. It’s all because people never wash their hands.",reaction:"+5"},
		{"text":"#If only our government would put tenth of the military cost in health care. Maybe then we wouldn’t have that problem",reaction:"+5"}]
		},
		{"choices":[{"text":"#Statistics show that there are over 10k political prisoners.",reaction:"+5"},
		{"text":"#No one should be in prison because of their political views. We are not living in the dark ages anymore",reaction:"+5"},
		{"text":"#They are in the hands of their judge. We respect our justice system.",reaction:"+5"},
		{"text":"#And the credits for that goes to our leader . Thanks a lot for getting rid of those scumbags ",reaction:"+5"}]
		},
		{"choices":[{"text":"#The Human rights watch condemned the current civil rights in our country and demand improvements",reaction:"+5"},
		{"text":"#They should mind their own business. Our people couldn’t be happier.",reaction:"+5"},
		{"text":"#Even those who are observing from a distance can smell the rotten smell of this regime.",reaction:"+5"},
		{"text":"#They are taking money from opposing parties to say such nonsense. ",reaction:"+5"}]
		},
		{"choices":[{"text":"#The country economy is suffering and the inflation rate has never been higher.",reaction:"+5"},
		{"text":"#We should open the door for donations from neighboring countries. It’s their duty to help us when we are in need.",reaction:"+5"},
		{"text":"#An egg-plant would have run this country better than this fool of a president. ",reaction:"+5"},
		{"text":"#It’s all the faults of those lazy workers. people need to work more",reaction:"+5"}]
		},
		{"choices":[{"text":"#30% increase in all judges and police officer salaries for the third time this year.",reaction:"+5"},
		{"text":"#They work hard .. They deserve such a raise.",reaction:"+5"},
		{"text":"#They think by doing that they are buying protection. But how long could their money last ??!",reaction:"+5"},
		{"text":"#Stop interfering in everyone’s business. ",reaction:"+5"}]
		},
		{"choices":[{"text":"#Death sentence to over 500 persons for the crime of murdering one police officer.",reaction:"+5"},
		{"text":"#Finally . this should be a good lesson for all those who think they can break the law.",reaction:"+5"},
		{"text":"#How on earth can 500 persons kill one person. Do they think we are stupid.",reaction:"+5"},
		{"text":"#No comments on Court orders",reaction:"+5"}]}
		];
}