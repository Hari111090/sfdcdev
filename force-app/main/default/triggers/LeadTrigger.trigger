trigger LeadTrigger on Lead (before update) 
{
    for(Lead lead : trigger.new) 
    {
        if (Lead.IsConverted)
        {
            // do something with the converted leads
        }
    }
}